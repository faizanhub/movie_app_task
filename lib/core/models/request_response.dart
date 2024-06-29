
import 'package:movie_app_task/core/enums/status.dart';

class RequestResponse<T> {

  late Status status;
  late String msg;
  late T? data;

  RequestResponse({required this.status, required this.msg, this.data});


}