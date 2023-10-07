import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app_bloc/pages/course/course_detail/bloc/course_detail_states.dart';
import 'package:ulearning_app_bloc/pages/course/course_detail/widgets/course_detail_widgets.dart';

import '../../../common/widgets/base_text_widget.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({super.key});

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  late Map<dynamic, dynamic> id;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    id = ModalRoute.of(context)!.settings.arguments as Map;
    if (kDebugMode) {
      print(
        id.values.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      children: [
                        thumbNail(
                          'images/86b887e108e25d8b4afb4c2d93b61b3c.jpeg',
                        ),
//                        menuView(context, CourseDetailStates state)
                        const SizedBox(
                          height: 10,
                        ),
                        menuView(context),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
