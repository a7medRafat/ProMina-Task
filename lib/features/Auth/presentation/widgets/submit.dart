import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/injuctoin_container.dart';
import '../../../../config/colors/app_colors.dart';
import '../../../../core/utils/vContainer.dart';
import '../../cubit/login_cubit.dart';

class Submit extends StatelessWidget {
  const Submit({super.key});

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      color: AppColors.primaryColor,
      height: 46.11.h,
      width: double.infinity,
      function: () {
        if (sl<LoginCubit>().formKey.currentState!.validate()) {
          sl<LoginCubit>().userLogin(
              email: sl<LoginCubit>().emailController.text,
              password: sl<LoginCubit>().passwordController.text);
        }
      },
      borderRadius: BorderRadius.circular(10),
      child: Center(
          child: Text('Submit',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold))),
    );
  }
}
