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
            child: CustomScrollView(
              //crossAxisAlignment: CrossAxisAlignment.start,
              slivers: [
                SliverToBoxAdapter(
                  child: homePageText(
                    'hello',
                    color: AppColors.primaryThirdElementText,
                    top: 20,
                  ),
                ),
                SliverToBoxAdapter(
                  child: homePageText(
                    'James Bond',
                    color: AppColors.primaryText,
                    top: 5,
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(top: 20.h),
                ),
                SliverToBoxAdapter(
                  child: searchView(),
                ),
                SliverToBoxAdapter(
                  child: slidersView(context, state),
                ),
                SliverToBoxAdapter(
                  child: menuView(),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    vertical: 18.h,
                    horizontal: 0.w,
                  ),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: 1.6,
                    ),
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () {
                            //   Navigator.of(context).pushNamed(
                            //       AppRoutes.COURSE_DETAIL,
                            //       arguments: {
                            //         "id":state.courseItem.elementAt(index).id,
                            //       }
                            //   );
                          },
                          //          child: courseGrid(state.courseItem[index]),
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                  'assets/icons/image_1.png',
                                ),
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(12.w),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    child: Text(
                                      'Best course for IT',
                                      style: TextStyle(
                                        color: AppColors.primaryElementText,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11.sp,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ));
                    }, childCount: 4
                        //childCount: state.courseItem.length,
                        ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
//      appBar: buildAppBar(userProfile.avatar.toString()),
  }
}
