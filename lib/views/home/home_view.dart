import 'package:cosmetics/core/components/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'pages/categories/view.dart';
import 'pages/home/view.dart';
import 'pages/my_cart.dart';
import 'pages/profile.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final pages = [
    _Model(image: 'home.svg', page: HomePage()),
    _Model(image:  'categories.svg', page: CategoriesPage()),
    _Model(image:  'my_cart.svg', page: MyCardPage()),
    _Model(image: 'profile.svg', page: ProfilePage()),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex].page,
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    bottomNavigationBar: Container(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.symmetric(horizontal: 13.h,vertical: 20.w),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 6.r,
              blurStyle: BlurStyle.outer,
              offset: Offset(-4, -4),
              color: Color(0xff000000),
            ),
            BoxShadow(
              blurRadius: 4.r,
              blurStyle: BlurStyle.outer,
              offset: Offset(4, 4),
              color: Color(0xff000000),
            ),
          ],
          borderRadius: BorderRadius.circular(25.r),
          border: Border.all(color: Color(0xffD9D9D9)),
        ),
        child: BottomNavigationBar(
          onTap: (value) {
            currentIndex = value;
            setState(() {});
          },

          currentIndex: currentIndex,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          elevation: 0,
          items: List.generate(
            4,
            (index) => BottomNavigationBarItem(
              label: '',
              icon:AppImage(path:   pages[index].image,
                color: currentIndex == index ? Color(0xffECA4C5) : null,)
            ),
          ),
        ),
      ),
    );
  }
}

class _Model {
  final String image;
  final Widget page;

  _Model({required this.image, required this.page});
}
