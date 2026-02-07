import 'package:cosmetics/core/logic/dio_helper.dart';
import 'package:cosmetics/core/logic/helper_methods.dart';
import 'package:cosmetics/core/logic/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/components/app_button.dart';
import '../../core/components/app_image.dart';
import '../../core/components/app_input.dart';

import '../../core/components/app_login_or_register.dart';
import '../../core/components/app_validator.dart';
import 'forget _password.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String? onSelectCountryCode;

  final phoneController = TextEditingController(text: '1234567890');

  final passwordController = TextEditingController(text: 'Password123!');

  final _formKey = GlobalKey<FormState>();
  DataState? state;

  Future<void> sendData() async {
    final phone = phoneController.text.trim();
    final password = passwordController.text.trim();

    final resp = await DioHelper.sendData(
      pass: '/api/Auth/login',
      data: {
        "countryCode": onSelectCountryCode,
        "phoneNumber": phone,
        "password": password,
      },
    );



      final model = User.fromJson(resp.data!);

   await CashHelper.saveUserData(model);

    if (resp.isSuccess) {
      state = DataState.success;

      showMessage(resp.mag);



      //goTo(HomeView(), canPop: false);
    } else {
      state = DataState.failed;

      showMessage(resp.mag, isError: true);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(13.r).copyWith(top: 48.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppImage(path: 'login.png', height: 227.h, width: 284.w),
                SizedBox(height: 25.h),
                Center(
                  child: Text(
                    'Login Now',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 14.h),

                Center(
                  child: Text(
                    'Please enter the details below to continue',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 25.h),
                AppInput(
                  validator: InputValidator.phoneValidator,
                  controller: phoneController,
                  isPassword: false,
                  isLottieControlled: true,
                  isKeyboardType: true,
                  dropDown: true,

                  onSelectedCountryCode: (value) {
                    onSelectCountryCode = value;
                  },
                  label: 'Phone Number',
                ),
                AppInput(
                  validator: InputValidator.passwordValidator,
                  controller: passwordController,
                  isKeyboardType: false,

                  label: 'Your Password',
                  path: 'arrow_down.svg',
                  isPassword: true,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      goTo(ForgetPasswordView(), canPop: true);
                    },
                    child: Text(
                      'Forget Password?',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 42.h),

                Center(
                  child: AppButton(
                    isLoading: state == DataState.loading,
                    width: 268.w,
                    text: 'Login',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        sendData();
                      }
                    },
                  ),
                ),
                SizedBox(height: 42.h),
                AppLoginOrRegister(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class User {
  late final String token;
  late final UserModel user;

  User.fromJson( Map<String,dynamic> json) {
    token = json['token'] ?? '';
    user = UserModel.fromJson(json['user']);
  }
}

class UserModel {
  late final int id;
  late final String username;
  late final String email;
  late final String phoneNumber;
  late final String countryCode;
  late final String role;
  late final String profilePhotoUrl;

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    username = json['username'] ?? '';
    email = json['email'] ?? '';
    phoneNumber = json['phoneNumber'] ?? '';
    countryCode = json['countryCode'] ?? '';
    role = json['role'] ?? '';
    profilePhotoUrl = json['profilePhotoUrl'] ?? '';
  }
}
