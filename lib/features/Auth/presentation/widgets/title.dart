import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina/config/colors/app_colors.dart';

class Gellary extends StatelessWidget {
  const Gellary({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('My\nGellary',
        style: TextStyle(
            fontSize: 50.sp,
            fontWeight: FontWeight.w800,
            color: AppColors.titles),
        textAlign: TextAlign.center);
  }
}
