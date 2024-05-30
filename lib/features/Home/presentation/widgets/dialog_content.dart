import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:promina/core/utils/loading.dart';
import 'package:promina/features/Home/cubit/gallery_cubit.dart';
import 'package:promina/features/Home/presentation/widgets/upload_container.dart';
import '../../../../app/injuctoin_container.dart';
import '../../../../config/colors/app_colors.dart';
import '../../../../core/utils/vContainer.dart';

class DialogContent extends StatelessWidget {
  const DialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GalleryCubit, GalleryState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (sl<GalleryCubit>().pickedImage == null)
              MyContainer(
                function: () =>
                    sl<GalleryCubit>().getImage(source: ImageSource.gallery),
                height: 65.h,
                width: 184.w,
                color: AppColors.gellaryColor,
                borderRadius: BorderRadius.circular(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/img.png',
                    ),
                    SizedBox(width: 10.sp),
                    Text('Gellary',
                        style:
                            TextStyle(fontSize: 27.sp, color: AppColors.titles))
                  ],
                ),
              ),
            if (sl<GalleryCubit>().pickedImage == null)
              MyContainer(
              function: () =>
                  sl<GalleryCubit>().getImage(source: ImageSource.camera),
              height: 65.h,
              width: 184.w,
              borderRadius: BorderRadius.circular(20),
              color: AppColors.camertaColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/3.png',
                  ),
                  Text('Camera',
                      style:
                          TextStyle(fontSize: 27.sp, color: AppColors.titles))
                ],
              ),
            ),
            if (sl<GalleryCubit>().pickedImage != null)
              const UploadContainer(),
          ],
        );
      },
    );
  }
}
