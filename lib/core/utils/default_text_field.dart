import 'package:flutter/material.dart';

import '../../config/colors/app_colors.dart';

class DefaultField extends StatelessWidget {
  final controller;
  final String hint;
  final bool isPassword;
  TextInputType textInputType;
  final validation;
  bool? borderSide = true;

  DefaultField({
    super.key,
    required this.controller,
    required this.hint,
    required this.isPassword,
    required this.textInputType,
    required this.validation,
    this.borderSide,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      validator: validation,
      obscureText: isPassword,
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(color: AppColors.body),
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(25),
        ),
        hintText: hint,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: AppColors.vGray),
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
      ),
    );
  }
}
