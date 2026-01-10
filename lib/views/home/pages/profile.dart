import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/app_image.dart';
import '../../../core/logic/helper_methods.dart';

import '../../check_out.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Theme.of(context).primaryColor),
          Container(
            height: 152.h,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0x434C6DD4).withValues(alpha: 0.83),
                  Color(0xffECA4C5),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            top: 105,
            right: 160,
            child: CircleAvatar(
              maxRadius: 45,
              child: AppImage(path: 'profile.png'),
            ),
          ),
          SizedBox(width: 16.h),
          Positioned(
            right: 110,
            top: 220,
            child: Text(
              'Sara Samer Talaat',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xff434C6D),
              ),
            ),
          ),
          SizedBox(height: 40.h),

          ListView.builder(

            padding: EdgeInsets.symmetric(vertical: 250.h, horizontal: 10.w),
            itemBuilder: (context, index) => _Item(index: index),
            itemCount: _list.length,
          ),
          SizedBox(height: 34.h),
          Positioned(
            top: 600,
            child: Container(
              padding: EdgeInsets.all(10.r),
              child: Row(
                children: [
                  AppImage(path: 'logout.svg'),
                  SizedBox(width: 8.w),
                  TextButton(
                    onPressed: () {
                      goTo(CheckOutView(),canPop: true);
                    },

                    child: Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffCD0F0F),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final int index;

  const _Item({required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      color: Theme.of(context).primaryColor,
      child: Row(
        children: [
          _list[index].label,
          SizedBox(width: 3.w),
          Text(
            _list[index].labels,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xff434C6D),
            ),
          ),
          Spacer(),
          IconButton(onPressed: () {}, icon:AppImage(path: 'arrow_right.png')),
        ],
      ),
    );
  }
}

class CardProfile {
  final Widget label;
  final String labels;

  CardProfile(this.label, this.labels);
}

final _list = [

  CardProfile(AppImage(path: 'edit_info.svg'), 'Edit Info'),
  CardProfile(AppImage(path: 'order_history.svg'), 'Order History'),
  CardProfile(AppImage(path: 'wallet.svg'), 'Wallet'),
  CardProfile(AppImage(path: 'setting.svg'), 'Settings'),
  CardProfile(AppImage(path: 'discount.svg'),'Voucher'),
];
