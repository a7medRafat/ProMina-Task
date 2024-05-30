import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GalleryImage extends StatelessWidget {
  const GalleryImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20), // Image border
        child: Image.network(
            height: 108.h,
            width: 108.w,
            image,
            fit: BoxFit.cover),
      ),
    );
  }
}
