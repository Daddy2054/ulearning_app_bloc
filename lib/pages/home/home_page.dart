import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/values/colors.dart';
import 'home_controller.dart';
import 'widgets/home_page_widgets.dart';

import 'bloc/home_page_bloc.dart';
import 'bloc/home_page_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController _homeController;

  @override
  void initState() {
    super.initState();
    _homeController = HomeController(context: context);
    _homeController.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(
        _homeController.userProfile.avatar.toString(),
      ),
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
                    'Hello',
                    color: AppColors.primaryThirdElementText,
                    top: 20,
                  ),
                ),
                SliverToBoxAdapter(
                  child: homePageText(
                    _homeController.userProfile.name ?? '',
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
                          child: courseGrid(),
                          //     child: courseGrid(state.courseItem[index]),
                        );
                      },
                      childCount: 4,
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
