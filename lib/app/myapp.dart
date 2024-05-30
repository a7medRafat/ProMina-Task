import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config/style/app_themes.dart';
import '../features/Auth/cubit/login_cubit.dart';
import '../features/Home/cubit/gallery_cubit.dart';
import 'injuctoin_container.dart';

class MyApp extends StatelessWidget {
  final Widget startWidget;

  const MyApp({super.key, required this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: sl<LoginCubit>()),
        BlocProvider.value(value: sl<GalleryCubit>()..getMyGallery()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: appTheme(),
            home: startWidget),
      ),
    );
  }
}
