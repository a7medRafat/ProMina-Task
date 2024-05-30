import 'package:flutter/material.dart';

class AppColors {
  // static Color scaffoldColor = const Color(0xffececec);
  static Color scaffoldColor = const Color(0xffe7e7e7);
  static Color primaryColor = const Color(0xff7BB3FF);
  static Color vBlue =  Colors.blue;
  static Color iconColor = Colors.black;
  static Color titles = const Color(0xff4A4A4A);
  static Color gellaryColor = const Color(0xffEFD8F9);
  static Color camertaColor = const Color(0xffEBF6FF);
  static Color body = Colors.black;
  static Color offColor = Colors.black;
  static Color vGray = Colors.grey;
  static Color vWhite = Colors.white;
  static Color vRed = Colors.redAccent;
  static Color bodySmall = const Color(0xff848484);
  static Color loading = Colors.blue.withOpacity(0.7);
  static Color vBottomNavColor = Colors.white;

  Shader instaGradient = const LinearGradient(
          colors: [Color(0xffF9CE34), Color(0xffee2a7b), Color(0xff6228d7)])
      .createShader(const Rect.fromLTWH(0.0, 0.0, 200, 70.0));
}
