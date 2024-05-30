import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promina/features/Auth/cubit/login_cubit.dart';
import 'package:promina/features/Auth/cubit/login_states.dart';
import '../../../../app/injuctoin_container.dart';
import '../../../../core/utils/default_text_field.dart';


class InputFields extends StatelessWidget {
  const InputFields({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Column(
          children: [
            DefaultField(
                controller: sl<LoginCubit>().emailController,
                hint: 'User Name',
                isPassword: false,
                textInputType: TextInputType.text,
                validation: (value) {
                  if (value.isEmpty) {
                    return 'email required';
                  }
                }),
            SizedBox(height: 15.h),
            DefaultField(
                controller: sl<LoginCubit>().passwordController,
                hint: 'Password',
                isPassword: true,
                textInputType: TextInputType.visiblePassword,
                validation: (value) {
                  if (value.isEmpty) {
                    return 'password required';
                  }
                }),
          ],
        );
      },
    );
  }
}
