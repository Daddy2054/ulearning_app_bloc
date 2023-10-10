import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app_bloc/pages/course/course_detail/course_detail_controller.dart';
import 'package:ulearning_app_bloc/pages/course/course_detail/widgets/course_detail_widgets.dart';

import '../../../common/widgets/base_text_widget.dart';
import 'bloc/course_detail_blocs.dart';
import 'bloc/course_detail_states.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({super.key});

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  // late Map<dynamic, dynamic> id;
  late CourseDetailController _courseDetailController;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // id = ModalRoute.of(context)!.settings.arguments as Map;
    // if (kDebugMode) {
    //   print(
    //     id.values.toString(),
    //   );
    // }
    _courseDetailController = CourseDetailController(context: context);
    _courseDetailController.init();
  }

  @override
  Widget build(BuildContext context) {
    int i = 0;
    print('------my build method------');
    return BlocBuilder<CourseDetailBloc, CourseDetailStates>(
      builder: (context, state) {
        // print('course id ${state.courseItem!.id}');
        // print('myitems ${state.courseItem!.toString()}');
        // print('description ${state.courseItem!.description.toString()}');
        print('-----state is called ${++i} times');
        return state.courseItem == null
            ? const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blue,
                ),
              )
            : Container(
                color: Colors.white,
                child: SafeArea(
                  child: Scaffold(
                      backgroundColor: Colors.white,
                      appBar: buildAppBar("Course detail"),
                      body: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 15.h,
                                horizontal: 25.w,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  thumbNail(
                                    //         'images/86b887e108e25d8b4afb4c2d93b61b3c.jpeg',
                                    state.courseItem!.thumbnail.toString(),
                                  ),
                                  //                        menuView(context, CourseDetailStates state)
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  menuView(context),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  reusableText('Course Description'),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  descriptionText(
                                    // 'Course Description Course Description Course Description Course Description Course Description Course Description Course Description ',
                                    state.courseItem!.description.toString(),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  //course buy button
                                  GestureDetector(
                                    onTap: () {
                                      _courseDetailController
                                          .goBuy(state.courseItem!.id);
                                    },
                                    child: appPrimaryButton("Go buy"),
                                  ),

                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  //course summary title
                                  courseSummaryTitle(),

                                  //course summary in list
                                  courseSummaryView(context, state),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  //Lesson list title
                                  reusableText("Lesson List"),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  //Course lesson list
                                  //courseLessonList(state)
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              );
      },
    );
  }
}
