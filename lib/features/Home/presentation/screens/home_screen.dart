import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina/core/utils/background.dart';
import 'package:promina/core/utils/loading.dart';
import 'package:promina/core/utils/toast.dart';
import 'package:promina/features/Home/cubit/gallery_cubit.dart';
import 'package:promina/features/Home/presentation/widgets/gallery_buttons.dart';
import '../../../../app/injuctoin_container.dart';
import '../../../../core/shared_preferances/cache_helper.dart';
import '../widgets/header.dart';
import '../widgets/image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      backGround: 'assets/images/gellary.png',
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: BlocConsumer<GalleryCubit, GalleryState>(
          buildWhen: (previous, current) => current is GetGallerySuccessState,
          listener: (context, state) {
            if (state is UploadImageSuccessState) {
              Navigator.pop(context);
              sl<GalleryCubit>().pickedImage = null;
              sl<GalleryCubit>().getMyGallery();
              MyToast.show(text: state.model.message!, context: context);
            }
          },
          builder: (context, state) {
            if (state is GetGalleryLoadingState) {
              return const Center(child: Loading());
            }
            if (state is GetGallerySuccessState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    NameAndAvatar(
                        name: CacheHelper.getData(key: 'name')),
                    SizedBox(height: 20.sp),
                    const GalleryButtons(),
                    SizedBox(height: 30.sp),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 3,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                      children: List.generate(
                          state.model.data!.images!.length,
                          (index) => GalleryImage(
                              image: state.model.data!.images![index])),
                    ),
                  ],
                ),
              );
            }
            return const Loading();
          },
        ),
      ),
    );
  }
}
