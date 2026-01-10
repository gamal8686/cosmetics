import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AppVerifyCode extends StatelessWidget {
final  TextEditingController? controller;
  const AppVerifyCode({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 80.r, right: 80.r),
      child: PinCodeTextField(

        controller: controller,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        keyboardType: TextInputType.number,

        appContext: context,
        cursorColor: Theme.of(context).primaryColor,

        length: 4,
        backgroundColor: Theme.of(
          context,
        ).primaryColor.withValues(alpha: 0.040),
        pinTheme: PinTheme(
          inactiveFillColor: Theme.of(context).primaryColor,

          selectedColor: Color(0xffD75D72),
          activeColor: Color(0xffD75D72),
          inactiveColor: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(8.r),

          fieldWidth: 45.w,
          fieldHeight: 45.h,
          shape: PinCodeFieldShape.box,
        ),
      ),
    );
  }
}
