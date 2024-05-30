import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina/core/go/go.dart';
import 'package:promina/core/utils/loading.dart';
import 'package:promina/features/Auth/cubit/login_states.dart';
import 'package:promina/features/Auth/presentation/widgets/login.dart';
import 'package:promina/features/Home/presentation/screens/home_screen.dart';
import '../../../../app/injuctoin_container.dart';
import '../../../../core/local_storage/hive_keys.dart';
import '../../../../core/local_storage/user_storage.dart';
import '../../../../core/shared_preferances/cache_helper.dart';
import '../../../../core/utils/background.dart';
import '../../../../core/utils/blury_container.dart';
import '../../../../core/utils/toast.dart';
import '../../cubit/login_cubit.dart';
import '../widgets/input_fields.dart';
import '../widgets/submit.dart';
import '../widgets/title.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      backGround: 'assets/images/login.png',
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            MyToast.show(text: 'Invalid Credntials', context: context);
          }
          if (state is LoginSuccessState) {
            if (state.model.token != null) {
              CacheHelper.saveData(key: 'token', value: state.model.token);
              CacheHelper.saveData(key: 'name', value: state.model.user!.name);
              Go.goTo(context, const HomeScreen());
            } else {
              MyToast.show(text: 'Invalid Credntials', context: context);
            }
          }
        },
        builder: (context, state) {
          return Form(
            key: sl<LoginCubit>().formKey,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Gellary(),
                  SizedBox(height: 15.h),
                  BlurredContainer(
                    width: 388.w,
                    height: 345.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Login(),
                        const InputFields(),
                        BlocBuilder<LoginCubit, LoginState>(
                          builder: (context, state) {
                            if (state is LoginLoadingState) {
                              return const Center(child: Loading());
                            }
                            return const Submit();
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
