//unify BlocProvider and routes and pages
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../pages/application/application_page.dart';
import '../../pages/application/bloc/app_bloc.dart';
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
          print('valid route name is: ${settings.name}');
        }
        //   bool deviceFirstOpen  = Global.storageService.getDeviceFirstOpen();
        //   if(result.first.route==AppRoutes.INITIAL&&deviceFirstOpen){
        //     bool isLoggedin = Global.storageService.getIsLoggedIn();
        //     if(isLoggedin){
        //       return MaterialPageRoute(builder: (_)=>const ApplicationPage(), settings: settings);
        //     }

        //     return MaterialPageRoute(builder: (_)=>const SignIn(), settings:settings);

        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    if (kDebugMode) {
      print('invalid route name is: ${settings.name}');
    }
    return MaterialPageRoute(
        builder: (_) => const SignIn(), settings: settings);
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
