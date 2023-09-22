import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app_bloc/pages/register/bloc/register_bloc.dart';

import 'sign_in/bloc/sign_in_bloc.dart';
import 'welcome/bloc/welcome_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(
          lazy: false,
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
          BlocProvider(
          create: (context) => RegisterBloc(),
        ),
      ];
}
