import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina/config/colors/app_colors.dart';

class NameAndAvatar extends StatelessWidget {
  const NameAndAvatar({super.key, required this.name});

  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Welcome\n$name',
          style: TextStyle(
              fontSize: 32.sp,
              color: AppColors.titles,
              fontWeight: FontWeight.normal),
        ),
        Padding(
          padding: EdgeInsets.only(right: 30.sp),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30.sp,
            backgroundImage: const NetworkImage(
                'https://img.freepik.com/free-photo/portrait-man-laughing_23-2148859448.jpg?t=st=1717029995~exp=1717033595~hmac=c5526ac8a16f0a9ef4e32fb68656c93b8b70183dd0a776fa02279cc3143506ed&w=740'),
          ),
        ),
      ],
    );
  }
}
