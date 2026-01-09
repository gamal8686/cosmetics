import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/components/app_image.dart';
import '../../../../core/components/app_input.dart';

part 'components/offers.dart';

part 'components/list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(8.0.r),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),
              AppInput(label: 'Search', isBorder: 25),
              SizedBox(height: 13.h),
              _Offers(),
              SizedBox(height: 24.h),
              _List(),
              SizedBox(height: 24.h),
              _List(isTopRated: true,),
            ],
          ),
        ),
      ),
    );
  }
}
