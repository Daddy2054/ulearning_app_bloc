// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../common/apis/course_api.dart';
import '../../../common/entities/entities.dart';
import '../../../common/routes/routes.dart';
import '../../../common/widgets/flutter_toast.dart';
import 'bloc/course_detail_blocs.dart';
import 'bloc/course_detail_events.dart';

class CourseDetailController {
  final BuildContext context;
  CourseDetailController({
    required this.context,
  });

  void init() async {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    asyncLoadCourseData(args["id"]);
    // asyncLoadLessonData(args["id"]);
    // asyncLoadCourseBought(args['id']);
  }

  asyncLoadCourseData(int? id) async {
    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;
    var result = await CourseAPI.courseDetail(params: courseRequestEntity);

    if (result.code == 200) {
      if (context.mounted) {
        if (kDebugMode) {
          print('---------context is ready------');
        }
        context.read<CourseDetailBloc>().add(TriggerCourseDetail(result.data!));
      } else {
        if (kDebugMode) {
          print('-------context is not available-------');
        }
      }
    } else {
      toastInfo(
          msg: "Something went wrong and check the log in the laravel.log");
    }
  }

  Future<void> goBuy(int? id) async {
    if (kDebugMode) {
      print('-----course is is $id');
    }
    EasyLoading.show(
        indicator: const CircularProgressIndicator(),
        maskType: EasyLoadingMaskType.clear,
        dismissOnTap: true);

    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;

    var result = await CourseAPI.coursePay(params: courseRequestEntity);
    EasyLoading.dismiss();
    if (result.code == 200) {
      //cleaner format of url
      var url = Uri.decodeFull(result.data!);

      //  print('------my returned stripe url is $url');
      if (context.mounted) {
        var res = await Navigator.of(context)
            .pushNamed(AppRoutes.PAY_WEB_VIEW, arguments: {"url": url});

        if (res == "success") {
          toastInfo(msg: "You bought it successfully");
        }
        if (kDebugMode) {
          print('----my returned stripe url is $url--------');
        }
      }
    } else {
      toastInfo(msg: result.msg!);
    }
  }
}
