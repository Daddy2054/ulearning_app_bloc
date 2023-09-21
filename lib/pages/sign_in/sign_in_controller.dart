import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app_bloc/pages/sign_in/bloc/sign_in_bloc.dart';

class SignInController {
  final BuildContext context;

  SignInController({required this.context});

  void handleSignIn(String type) {
    try {
      if (type == 'email') {
        final state = context.read<SignInBloc>().state;
      }
    } catch (e) {}
  }
}
