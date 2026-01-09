
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/components/app_button.dart';
import '../../core/components/app_image.dart';
import '../../core/logic/helper_methods.dart';
import '../home/home_view.dart';
import 'login.dart';

class AccountActivatedDialog extends StatelessWidget {
  final bool isFromCreateAccount;

  const AccountActivatedDialog({super.key, this.isFromCreateAccount = false});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      children: [
        Container(
          margin: EdgeInsetsDirectional.all(15.r),
          child: Column(
            children: [
              AppImage(path: 'success_check.json', height: 100.h, width: 100.w),

              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.all(8.0.r),
                child: Text(
                  isFromCreateAccount
                      ? 'Account Activated!'
                      : 'Password Created!',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                isFromCreateAccount
                    ? 'Congratulations! Your account\n has been successfully activated'
                    : 'Congratulations! Your password has been successfully created',
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 26.h),

              AppButton(
                onPressed: () {
                  goTo(
                    isFromCreateAccount ? HomeView() : LoginView(),
                    canPop: false,
                  );
                },
                text: isFromCreateAccount
                    ? 'Go to home'
                    : 'Return to login',
                width: 270.w,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
