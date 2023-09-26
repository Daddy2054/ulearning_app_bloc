import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/routes/routes.dart';
import '../../../common/values/colors.dart';
import '../../../common/widgets/base_text_widget.dart';

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
        reusableText("Profile", fontWeight: FontWeight.bold),
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

//profile icon and edit button
Widget profileIconAndEditButton() {
  return Container(
    alignment: Alignment.bottomRight,
    padding: EdgeInsets.only(right: 6.w),
    width: 80.w,
    height: 80.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.w),
      image: const DecorationImage(
        image: AssetImage(
          "assets/icons/headpic.png",
        ),
      ),
    ),
    child: Image(
      width: 25.w,
      height: 25.h,
      image: const AssetImage(
        "assets/icons/edit_3.png",
      ),
    ),
  );
}

Widget buildProfileName(
//  ProfileStates state,
    ) {
  return
      // state.userProfile == null
      //     ? Container(
      //         child: reusableText.reusableText("No name found"),
      //       )
//      :
      Container(
    padding: EdgeInsets.only(left: 50.w, right: 50.w),
    margin: EdgeInsets.only(bottom: 10.h, top: 5.h),
    child: Text(
      //          state.userProfile?.name ??
      "no name given",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColors.primarySecondaryElementText,
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget buildListView(BuildContext context) {
  return Column(
    children: [
      // ...List.generate(
      //   imagesInfo.length,
      //   (index) => GestureDetector(
      //     onTap: (){
      //       if(index==0){
      //         Navigator.of(context).pushNamed(AppRoutes.SETTINGS);
      //       }else if(index==1){
      //         Navigator.of(context).pushNamed(AppRoutes.PAYMENT_DETAILS);
      //       }
      //     },
//          child:
      Container(
        margin: EdgeInsets.only(bottom: 15.h),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.SETTINGS);
              },
              child: Container(
                width: 40.w,
                height: 40.h,
                padding: EdgeInsets.all(7.0.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.w),
                  //  color: AppColors.primaryElement,
                ),
                child: const Icon(Icons.settings),
                // child: Image.asset(
                //     "assets/icons/${imagesInfo.values.elementAt(index)}",
                //     ),
              ),
            ),
            Text(
              'Settings',
              style: TextStyle(
                color: AppColors.primaryText,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
            // Text(imagesInfo.keys.elementAt(index),
            //     style: TextStyle(
            //         color: AppColors.primaryText,
            //         fontWeight: FontWeight.bold,
            //         fontSize: 16.sp)
            // )
          ],
        ),
      ),
    ],
  );
}
