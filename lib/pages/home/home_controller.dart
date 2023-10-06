import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/apis/course_api.dart';
import '../../common/entities/entities.dart';
import '../../global.dart';
import 'bloc/home_page_bloc.dart';
import 'bloc/home_page_event.dart';

class HomeController {
  late BuildContext context;
  UserItem? get userProfile => Global.storageService.getUserProfile();

  static final HomeController _singleton = HomeController._external();

  HomeController._external();
  //this is a factory constructor
  //makes sure you have the the original only one instance
  factory HomeController({required BuildContext context}) {
    _singleton.context = context;
    return _singleton;
  }

  Future<void> init() async {
    if (kDebugMode) {
      print('...home controller init method');
    }
    //make sure the user is logged in and then make an api call
    if (Global.storageService.getUserToken().isNotEmpty) {
      var result = await CourseAPI.courseList();
      if (result.code == 200) {
        if (context.mounted) {
          context.read<HomePageBloc>().add(
                HomePageCourseItem(result.data!),
              );
          return;
        }
        // if (kDebugMode) {
        //   print('perfect');
        //   print(result.data![0].description);
        // }
      } else {
        if (kDebugMode) {
          print(result.code);
        }
        return;
      }
    } else {
      if (kDebugMode) {
        print("User has already logged out");
      }
    }
    return;
  }
}
