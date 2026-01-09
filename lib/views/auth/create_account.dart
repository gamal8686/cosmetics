import 'package:cosmetics/core/logic/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/components/app_button.dart';
import '../../core/components/app_image.dart';

import '../../core/components/app_input.dart';
import '../../core/components/app_login_or_register.dart';
import '../../core/components/app_validator.dart';
import '../../core/logic/helper_methods.dart';
import 'otp.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  String? onSelectedCountryCode;
  final formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _number = TextEditingController();
  final _password = TextEditingController();

  Future<void> sentData() async {

    final resp = await DioHelper.sendData(
      pass: '/api/Auth/register',
      data: {
        "username": _name.text.trim(),
        "countryCode": onSelectedCountryCode,
        "phoneNumber": _number.text.trim(),
        "email": _email.text.trim(),
        "password": _password.text.trim(),
      },
    );
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
        padding: EdgeInsetsDirectional.all(14.r).copyWith(top: 40.r),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppImage(path: 'logo.png', height: 65.h, width: 65.w),
              SizedBox(height: 40.h),
              Text(
                'Create Account',
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 50.h),

              AppInput(

                  controller: _name, label: 'Your Name'),
              AppInput(controller: _email , label: 'Email '),
              AppInput(
                validator: InputValidator.phoneValidator,
                onSelectedCountryCode: (value) {
                  onSelectedCountryCode = value;
                },
                controller: _number,
                label: 'Phone Number',
                dropDown: true,
              ),
              AppInput(
                validator: InputValidator.passwordValidator,
                controller: _password,
                label: 'Create your Password',
                isPassword: true,
              ),
              AppInput(
                  validator: InputValidator.passwordValidator,
                  label: 'Confirm password', isPassword: true),
              SizedBox(height: 90.h),
              Center(
                child: AppButton(
                  width: 270.w,
                  onPressed: () {
                    if(formKey.currentState!.validate())
                    sentData();
                    goTo(VerifyCode(isFromCreateAccount: true), canPop: true);
                  },
                  text: 'Next',
                ),
              ),
              SizedBox(height: 80.h),
              AppLoginOrRegister(isLogin: false),
            ],
          ),
        ),
      ),
    );
  }
}
