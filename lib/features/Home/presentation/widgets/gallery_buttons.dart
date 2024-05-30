import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina/core/utils/dialog.dart';
import 'package:promina/features/Home/cubit/gallery_cubit.dart';
import 'package:promina/features/Home/presentation/widgets/dialog_content.dart';
import '../../../../app/injuctoin_container.dart';
import '../../../../config/colors/app_colors.dart';
import '../../../../core/utils/vContainer.dart';

class GalleryButtons extends StatelessWidget {
  const GalleryButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        custom(
          text: 'log out',
          images: [
            Image.asset('assets/images/red.png',width: 28.83.w,height: 32.22.h),
            Image.asset('assets/images/Vector-1.png'),
          ],
          height: 39.85.h,
          width: 145.w,
          function: () => sl<GalleryCubit>().signOut(context),
        ),
        custom(
            text: 'upload',
            width: 145.w,
            images: [
              Image.asset('assets/images/upload.png',width:31.74.w,height: 28.4.h),
            ],
            height: 39.85.h,
            function: () => MyDialog.show(context, const DialogContent())),
      ],
    );
  }

  Widget custom(
          {required String text,
          required double width,
          required List<Widget> images,
          required Function() function,
          required double height}) =>
      MyContainer(
        function: function,
        borderRadius: BorderRadius.circular(15),
        color: AppColors.vWhite,
        width: width,
        height: height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              alignment: Alignment.center,
              children: images,
            ),
            Text(
              text,
              style: TextStyle(color: AppColors.titles, fontSize: 20.sp),
            )
          ],
        ),
      );
}
