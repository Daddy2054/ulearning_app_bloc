import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: buildAppBar("Course detail"),
      body: Center(
        child: Text(
          id.values.toString(),
        ),
      ),
    );
  }
}
