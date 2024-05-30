import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/colors/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.function,
      required this.text,
      this.btnColor,
      this.txtColor});

  final Function() function;
  final String text;
  final Color? btnColor;
  final Color? txtColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 0,
      padding: const EdgeInsets.symmetric(vertical: 17),
      onPressed: function,
      color: AppColors.primaryColor,
      minWidth: 282.42.w,
      height: 46.11.h,
      textColor: AppColors.scaffoldColor,
      child: Text(text.toUpperCase(),style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        fontSize: 10.sp
      )),
    );
  }
}
