import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../common/entities/entities.dart';
import '../../global.dart';

class HomeController {
  late BuildContext context;
  UserItem get userProfile => Global.storageService.getUserProfile();

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
    //  if(Global.storageService.getUserToken().isNotEmpty){
    //    var result = await CourseAPI.courseList();
    //    if(result.code==200){
    //      if(context.mounted){
    //        context.read<HomePageBlocs>().add(HomePageCourseItem(result.data!));
    //         return;
    //      }
    //    }else{
    //      print(result.code);
    //      return;
    //    }
    //  }else{
    //    print("User has already logged out");
    //  }
    return;
  }
}
