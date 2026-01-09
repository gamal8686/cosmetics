import 'package:cosmetics/core/logic/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/app_image.dart';
import '../../../../core/components/app_input.dart';

part 'components/list_product.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: Text(
                'Categories',
                style: TextStyle(
                  color: Color(0xff434C6D),
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 12.h),
            AppInput(label: 'Search', path: 'search.svg', isBorder: 25),
            SizedBox(height: 12.h),
            _ListProduct(),
          ],
        ),
      ),
    );
  }
}
