import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common_widgets.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 18.w,
          height: 12.h,
          child: Image.asset(
            "assets/icons/menu.png",
          ),
        ),
        reusableText("Profile"),
        SizedBox(
          width: 24.w,
          height: 24.h,
          child: Image.asset(
            "assets/icons/more-vertical.png",
          ),
        ),
      ],
    ),
  );
}
