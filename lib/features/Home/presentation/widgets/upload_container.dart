import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina/core/utils/loading.dart';
import '../../../../app/injuctoin_container.dart';
import '../../../../config/colors/app_colors.dart';
import '../../../../core/utils/vContainer.dart';
import '../../cubit/gallery_cubit.dart';

class UploadContainer extends StatelessWidget {
  const UploadContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GalleryCubit, GalleryState>(
      builder: (context, state) {
        if(state is UploadImageLoadingState){
          return const Center(child: Loading());
        }
        return MyContainer(
          function: () => sl<GalleryCubit>().uploadImg(),
          height: 65.h,
          width: 184.w,
          borderRadius: BorderRadius.circular(20),
          color: AppColors.primaryColor,
          child: Center(
            child: Text('Upload',
                style: TextStyle(fontSize: 27.sp, color: AppColors.titles)),
          ),
        );
      },
    );
  }
}
