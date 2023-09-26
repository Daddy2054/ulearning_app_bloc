import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app_bloc/common/values/colors.dart';
import 'package:ulearning_app_bloc/pages/home/widgets/home_page_widgets.dart';

import 'bloc/home_page_bloc.dart';
import 'bloc/home_page_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 25.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                homePageText(
                  'hello',
                  color: AppColors.primaryThirdElementText,
                  top: 20,
                ),
                homePageText(
                  'James Bond',
                  color: AppColors.primaryText,
                  top: 5,
                ),
                const SizedBox(
                  height: 20,
                ),
                searchView(),
                slidersView(context,state),
              ],
            ),
          );
        },
      ),
    );
//      appBar: buildAppBar(userProfile.avatar.toString()),
  }
}
