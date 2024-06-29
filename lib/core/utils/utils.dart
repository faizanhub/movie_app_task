import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_task/core/constants/colors.dart';

class Utils {
  static showFlushBar(BuildContext context, String title, String message) {
    return Flushbar(
      // title: title,
      message: message,
      duration: const Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
      margin: const EdgeInsets.all(17),
      backgroundColor: AppColors.primary,
      borderRadius: BorderRadius.circular(10),
    ).show(context);
  }


    Map<int, String> genreMap = {
    28: 'Action',
    12: 'Adventure',
    16: 'Animation',
    35: 'Comedy',
    80: 'Crime',
    99: 'Documentary',
    18: 'Drama',
    10751: 'Family',
    14: 'Fantasy',
    36: 'History',
    27: 'Horror',
    10402: 'Music',
    9648: 'Mystery',
    10749: 'Romance',
    878: 'Science Fiction',
    10770: 'TV Movie',
    53: 'Thriller',
    10752: 'War',
    37: 'Western'
  };

   String getGenreName(int genreId) {
    return genreMap[genreId] ?? 'Unknown';
  }

  static String formatMovieLength(int length) {
    int hours = length ~/ 60;
    int minutes = length % 60;
    return '${hours}h ${minutes}m';
  }

  static String getLanguageName(String shortcode) {
    Map<String, String> languages = {
      'en': 'English',
      'es': 'Spanish',
      'fr': 'French',
      'de': 'German',
      'it': 'Italian',
      'zh': 'Mandarin Chinese',
      'hi': 'Hindi',
      'ar': 'Standard Arabic',
      'bn': 'Bengali',
      'ru': 'Russian',
      'pt': 'Portuguese',
      'id': 'Indonesian',
      'ur': 'Urdu',
      'ja': 'Japanese',
      'sw': 'Swahili',
      'mr': 'Marathi',
      'te': 'Telugu',
      'tr': 'Turkish',
      'ko': 'Korean',
      'ta': 'Tamil',
      'vi': 'Vietnamese',
    };

    return languages[shortcode] ?? 'Unknown';
  }

}
