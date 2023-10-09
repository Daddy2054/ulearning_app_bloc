// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/apis/course_api.dart';
import '../../../common/entities/entities.dart';
import '../../../common/widgets/flutter_toast.dart';
import 'bloc/course_detail_blocs.dart';
import 'bloc/course_detail_events.dart';

class CourseDetailController {
  final BuildContext context;
  CourseDetailController({
    required this.context,
  });

  void init() async{
        final args = ModalRoute.of(context)!.settings.arguments as Map;
    asyncLoadCourseData(args["id"]);
    // asyncLoadLessonData(args["id"]);
    // asyncLoadCourseBought(args['id']);
  }

  asyncLoadCourseData(int? id)async{
    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;
    var result = await CourseAPI.courseDetail(params: courseRequestEntity);

    if(result.code ==200){
      if(context.mounted){
        print('---------context is ready------');
        context.read<CourseDetailBloc>().add(TriggerCourseDetail(result.data!));
      }else{
        print('-------context is not available-------');
      }

    }else{
      toastInfo(msg: "Something went wrong and check the log in the laravel.log");
    }
  }
      
    
  
  
}
