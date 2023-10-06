//unify BlocProvider and routes and pages
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../global.dart';
import '../../pages/application/application_page.dart';
import '../../pages/application/bloc/app_bloc.dart';
import '../../pages/course/course_detail/bloc/course_detail_blocs.dart';
import '../../pages/course/course_detail/course_detail.dart';
import '../../pages/home/bloc/home_page_bloc.dart';
import '../../pages/home/home_page.dart';
import '../../pages/profile/settings/bloc/settings_bloc.dart';
import '../../pages/profile/settings/settings_page.dart';
import '../../pages/register/bloc/register_bloc.dart';
import '../../pages/register/register.dart';
import '../../pages/sign_in/bloc/sign_in_bloc.dart';
import '../../pages/sign_in/sign_in.dart';
import '../../pages/welcome/bloc/welcome_bloc.dart';
import '../../pages/welcome/welcome.dart';
import 'names.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const Welcome(),
        bloc: BlocProvider(
          create: (_) => WelcomeBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.SING_IN,
        page: const SignIn(),
        bloc: BlocProvider(
          create: (_) => SignInBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.REGISTER,
        page: const Register(),
        bloc: BlocProvider(
          create: (_) => RegisterBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
        bloc: BlocProvider(
          create: (_) => AppBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.HOME_PAGE,
        page: const HomePage(),
        bloc: BlocProvider(
          create: (_) => HomePageBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.SETTINGS,
        page: const SettingsPage(),
        bloc: BlocProvider(
          create: (_) => SettingsBloc(),
        ),
      ),
       PageEntity(
          route: AppRoutes.COURSE_DETAIL,
          page: const CourseDetail(),
          bloc: BlocProvider(create: (_)=>CourseDetailBloc(),)
      ),
    ];
  }

  //return all the bloc providers
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  // a modal that covers entire screen as we click on navigator object
  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      //check for route name macthing when navigator gets triggered.
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        if (kDebugMode) {
//          print('valid route name is: ${settings.name}');
          print('first log');
          print(result.first.route);
        }
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          if (kDebugMode) {
//          print('valid route name is: ${settings.name}');
            print('second log');
          }
          bool isLoggedin = Global.storageService.getIsLoggedIn();
          if (isLoggedin) {
            return MaterialPageRoute(
              builder: (_) => const ApplicationPage(),
              settings: settings,
            );
          }

          return MaterialPageRoute(
            builder: (_) => const SignIn(),
            settings: settings,
          );
        }
        return MaterialPageRoute(
          builder: (_) => result.first.page,
          settings: settings,
        );
      }
    }
    if (kDebugMode) {
      print('invalid route name is: ${settings.name}');
    }
    return MaterialPageRoute(
      builder: (_) => const SignIn(),
      settings: settings,
    );
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({
    required this.route,
    required this.page,
    this.bloc,
  });
}
