import 'package:cosmetics/core/logic/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/components/app_image.dart';
import '../core/logic/helper_methods.dart';
import 'auth/login.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => OnBoardingViewState();
}

class OnBoardingViewState extends State<OnBoardingView> {
  final list = [
    Model(
      image: 'on_boarding1.png',
      titel: 'WELCOME',
      desc:
          'Makeup has the power to transform your mood and empowers you to be a more confident person.',
    ),
    Model(
      image: 'on_boarding2.png',
      titel: 'SEARCH & PICK',
      desc:
          'We have dedicated set of products and routines hand picked for every skin type.',
    ),
    Model(
      image: 'on_boarding3.png',
      titel: 'PUCH NOTIFICATIONS',
      desc: 'Allow notifications for new makeup & cosmetics offers.',
    ),
  ];

  int counterIndex = 0;

  goToLogin() {
CashHelper.setIsNotFirst();
    goTo( LoginView(), canPop: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 37.w),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (counterIndex < 2)
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: goToLogin,
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff434C6D),
                      ),
                    ),
                  ),
                ),
              AppImage(path: list[counterIndex].image),
              SizedBox(height: 25.h),
              Text(
                list[counterIndex].titel,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 25.h),

              Text(
                list[counterIndex].desc,
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.h),

              counterIndex == 2
                  ? FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: Color(0xff434C6D),
                        fixedSize: Size(268, 60),
                      ),
                      onPressed: () {
                        goToLogin();
                      },
                      child: AppImage(path: 'arrow_right.svg'),
                    )
                  : FloatingActionButton(
                      backgroundColor: Color(0xff434C6D),
                      onPressed: () {
                        if (counterIndex < 2) {
                          counterIndex++;
                          setState(() {});
                        } else {
                          goToLogin();
                        }
                      },
                      child: AppImage(path: 'arrow_right.svg'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class Model {
  final String image, titel, desc;

  Model({required this.image, required this.titel, required this.desc});
}
