import 'package:cosmetics/core/logic/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/components/app_back.dart';
import '../../core/components/app_button.dart';
import '../../core/components/app_image.dart';
import '../../core/components/app_input.dart';
import '../../core/logic/helper_methods.dart';
import 'otp.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final formKey=GlobalKey<FormState>();
   String? selectedCountryCode;
  final  _controller=TextEditingController();
  Future<void> sendData()async{
    final resp=await DioHelper.sendData(
        data: {
          "countryCode": selectedCountryCode,
          "phoneNumber": _controller.text.trim()


        },
        pass: '/api/Auth/forgot-password');
    if (resp.isSuccess) {
      showMessage(resp.mag);
    } else {
      showMessage(resp.mag, isError: true);
    }



  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.all(14.r).copyWith(top: 50.r),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppBack(),
              SizedBox(height: 40.h),

              AppImage(path: 'logo.png', height: 65.h, width: 65.w),
              SizedBox(height: 40.h),
              Text(
                'Forget Password',
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 50.h),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Please enter your phone number below\n to recovery your password.',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: 40.h),

              AppInput(
                onSelectedCountryCode: (value) {
                  selectedCountryCode=value;
                },
                  controller: _controller,
                  label: 'Phone Number', dropDown: true),

              SizedBox(height: 55.h),
              Center(
                child: AppButton(
                  width: 270.w,
                  onPressed: () {
                    if(formKey.currentState!.validate())
                {    sendData();}
                    goTo(VerifyCode());
                  },
                  text: 'Next',
                ),
              ),
              SizedBox(height: 80.h),
            ],
          ),
        ),
      ),
    );
  }
}
