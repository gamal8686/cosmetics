
import 'package:animate_do/animate_do.dart';
import 'package:cosmetics/core/logic/shared_preferences.dart';
import 'package:cosmetics/views/auth/login.dart';
import 'package:cosmetics/views/home/home_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/components/app_image.dart';
import '../core/logic/helper_methods.dart';
import 'on_boarding.dart';

class SplashViews extends StatefulWidget {
  const SplashViews({super.key});

  @override
  State<SplashViews> createState() => _SplashViewsState();
}

class _SplashViewsState extends State<SplashViews> {
  @override
  void initState() {
    super.initState();

    goTo(CashHelper.getIsNotFirst? OnBoardingView():CashHelper.isAuth?HomeView():LoginView(), delayDuration: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SpinPerfect(
              duration: Duration(seconds: 4),
              child: AppImage(path: 'logo.png'),
            ),
            SizedBox(height: 16.h),
            AppImage(path: 'splash_txt.png'),
          ],
        ),
      ),
    );
  }
}
