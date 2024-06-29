import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:movie_app_task/core/constants/app_exceptions.dart';

abstract class BaseNetworkService {
  Future<dynamic> getGetApiResponse(String url);

  Future<dynamic> getPostApiResponse(String url, Map<String, dynamic> data);
}

class NetworkService extends BaseNetworkService {
  var headers = {'Authorization': 'Bearer ${dotenv.env['API_KEY']}', 'Content-Type': 'application/json'};

  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url), headers: headers).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } on TimeoutException {
      throw TimeoutException('Request timed out');
    }

    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response = await post(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: headers,
      ).timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } on TimeoutException {
      throw TimeoutException('Request timed out');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    print('@Network Service => ${response.statusCode}');
    switch (response.statusCode) {
      case 200:
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.reasonPhrase);
      case 401:
        throw BadRequestException(response.reasonPhrase);
      case 404:
        throw UnauthorizedException(response.reasonPhrase);
      case 500:
        throw BadRequestException(response.reasonPhrase);

      default:
        throw FetchDataException('Error occurred while communicating with server ${response.statusCode}');
    }
  }
}
