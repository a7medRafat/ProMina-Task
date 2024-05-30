import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:promina/core/local_storage/user_storage.dart';
import 'package:promina/features/Home/presentation/screens/home_screen.dart';
import 'app/bloc_observer.dart';
import 'app/injuctoin_container.dart' as di;
import 'app/myapp.dart';
import 'core/dio_helper/dio_helper.dart';
import 'core/shared_preferances/cache_helper.dart';
import 'features/Auth/data/models/LoginModel.dart';
import 'features/Auth/presentation/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();
  await di.init();
  DioHelperImpl().init();
  await CacheHelper.init();
  await Hive.initFlutter();
  Hive.registerAdapter(LoginModelAdapter());
  CurrentUser().init();
  await CacheHelper.init();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  final String? token = CacheHelper.getData(key: 'token');

  final Widget widget;

  if (token != null) {
    widget = const HomeScreen();
  } else {
    widget = const LoginScreen();
  }
  runApp(MyApp(startWidget: widget));
}
