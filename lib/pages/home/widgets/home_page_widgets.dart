import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/colors.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 15.w,
          height: 12.h,
          child: const Icon(Icons.menu),
        ),
        GestureDetector(
          child: Container(
            width: 40.w,
            height: 40.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/person.png'),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

//reusable big text widget
Widget homePageText(
  String text, {
  Color color = AppColors.primaryText,
  int top = 20,
}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget searchView() {
  var hintText = 'search your course';
  return Row(
    children: [
      Container(
        width: 275.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.h),
          border: Border.all(
            color: AppColors.primaryFourthElementText,
          ),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            SizedBox(
              width: 220.w,
              height: 40.h,
              child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: hintText,
                  ),
                  onChanged: (value) {},
                  onSubmitted: (value) {}),
            ),
          ],
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            //      color: AppColors.primaryElement,
            borderRadius: BorderRadius.all(Radius.circular(13.w)),
            border: Border.all(color: AppColors.primaryElement),
          ),
          child: const Icon(Icons.settings),
//          child: Image.asset("assets/icons/options.png"),
        ),
      ),
    ],
  );
}

Widget slidersView() {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 160.h,
        child: PageView(
          children: [
            _slidersContainer(path: "assets/icons/art.png"),
            _slidersContainer(path: "assets/icons/image_1.png"),
            _slidersContainer(path: "assets/icons/image_2.png"),
          ],
        ),
      ),
      DotsIndicator(
        dotsCount: 3,
//          position: state.index.toDouble(),
        decorator: DotsDecorator(
          color: AppColors.primaryThirdElementText,
          activeColor: AppColors.primaryElement,
          size: const Size.square(5.0),
          activeSize: const Size(17.0, 5.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    ],
  );
}

// sliders widget
Widget _slidersContainer({String path = "assets/icons/art.png"}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(20.h),
      ),
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(path),
      ),
    ),
  );
}
