
import 'package:cosmetics/views/auth/create_account.dart';
import 'package:cosmetics/views/auth/create_password.dart';
import 'package:cosmetics/views/auth/login.dart';
import 'package:cosmetics/views/home/home_view.dart';
import 'package:cosmetics/views/home/pages/categories/view.dart';
import 'package:cosmetics/views/home/pages/home/view.dart';
import 'package:cosmetics/views/home/pages/profile.dart';
import 'package:cosmetics/views/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/logic/helper_methods.dart';
import 'core/logic/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final primary = Color(0xff8E8EA9);
    final primarySwatch = MaterialColor(primary.value, {
      50: primary.withValues(alpha: .1),
      100: primary.withValues(alpha: .2),
      200: primary.withValues(alpha: .3),
      300: primary.withValues(alpha: .4),
      400: primary.withValues(alpha: .5),
      500: primary,
      600: primary.withValues(alpha: .6),
      700: primary.withValues(alpha: .7),
      800: primary.withValues(alpha: .8),
      900: primary,
    });
    return ScreenUtilInit(
      designSize: Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        navigatorKey: navKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: TextTheme(
            bodyMedium: TextStyle(
              fontSize: 14.sp,
              wordSpacing: 0,
              letterSpacing: 2,
              color: Color(0xff434C6D),
            ),
          ),

          fontFamily: 'Montserrat',
          filledButtonTheme: FilledButtonThemeData(
            style: FilledButton.styleFrom(
              fixedSize: Size.fromHeight(65.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.r),
              ),
              backgroundColor: Color(0xffD75D72),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            fillColor: Color(0xff5a669066).withValues(alpha: .40),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: Color(0xff5a669066).withValues(alpha: 0.040),
              ),
            ),
          ),
          appBarTheme: AppBarTheme(color: Color(0xffD9D9D9)),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: primarySwatch),

          cardColor: Color(0xffECA4C5),
          scaffoldBackgroundColor: Color(0xffD9D9D9),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(foregroundColor: Color(0xffD75D72)),
          ),
        ),
        title: 'Cosmetics',
        home:const HomeView(),
      ),
    );
  }
}
