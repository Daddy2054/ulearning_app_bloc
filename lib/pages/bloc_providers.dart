import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_blocs.dart';
import 'sign_in/bloc/sign_in_bloc.dart';
import 'welcome/bloc/welcome_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(
          lazy: false,
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => AppBlocs(),
        ),
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
      ];
}
