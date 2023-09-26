import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app_bloc/pages/profile/widgets/profile_widgets.dart';

import '../../common/values/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //for showing profile image
              profileIconAndEditButton(),
              SizedBox(
                height: 30.h,
              ),
              //for showing profile name
              buildProfileName(),
              //   buildProfileName(state),
              //  //build row buttons
              //   buildRowView(context),

              //  // SizedBox(height: 30.h,),
              //   Padding(
              //     padding: EdgeInsets.only(left:25.w ),
              //     child: buildListView(context),
              //   ),
            ],
          ),
        ),
      ),
    );
  }
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
