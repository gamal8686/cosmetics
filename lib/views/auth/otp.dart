
import 'package:cosmetics/core/logic/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/components/app_back.dart';
import '../../core/components/app_button.dart';
import '../../core/components/app_image.dart';

import '../../core/components/app_verify_code.dart';
import '../../core/logic/helper_methods.dart';
import 'account_dailog.dart';
import 'create_password.dart';

class VerifyCode extends StatefulWidget {

  final bool isFromCreateAccount;
  const VerifyCode({super.key,  this.isFromCreateAccount=false, });

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  final _formKey=GlobalKey<FormState>();
   final _controller =TextEditingController();
   Future<void> sendData()async{

     final resp=await DioHelper.sendData(pass: '/api/Auth/verify-otp',data: {
       "countryCode": "+20",
       ///todo i need the countrycode

       "phoneNumber": "1234567890",
       ///todo i need the phone number
       "otpCode":_controller.text.trim()
     });
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
        padding: EdgeInsetsDirectional.all(13.r),
        child: Form(
           key:  _formKey,
          child: Column(
            children: [
              SizedBox(height: 40.h),

              AppBack(),
              AppImage(path: 'logo.png', height: 65.h, width: 65.w),
              SizedBox(height: 40.h),
              Text(
                'Verify Code',
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 40.h),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: Color(0xff8E8EA9),
                  ),
                  children: [
                    TextSpan(
                      text: 'We just sent a 4-digit verification code to\n',
                    ),
                    TextSpan(
                      locale: Locale('en'),
                      text: '+20 1022658997.',
                      style: TextStyle(
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    TextSpan(text: 'Enter the code in the box\n'),
                    TextSpan(text: 'below to continue.'),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Text('Edit the number'),
                ),
              ),
              AppVerifyCode(controller: _controller,),

              SizedBox(height: 40.h),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Didn’t receive a code?',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                  TextButton(
                    clipBehavior: Clip.none,
                    onPressed: () {},
                    child: Text('Resend'),
                  ),
                  Spacer(),
                  TextButton(onPressed: () {}, child: Text('0:36')),
                ],
              ),

              SizedBox(height: 116.h),
              AppButton(
                width: 270.w,

                text: 'Done',
                onPressed: () {
                  if(_formKey.currentState!.validate())
                {  sendData();}
                  if(widget.isFromCreateAccount){
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) => AccountActivatedDialog(),
                    );


                  }else{
                    goTo(CreatePasswordView());


                  }

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
