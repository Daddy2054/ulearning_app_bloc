import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app_bloc/pages/register/bloc/register_bloc.dart';

import '../../common/widgets/flutter_toast.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController({
    required this.context,
  });

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;

    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: "User name can not be empty");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email name can not be empty");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password name can not be empty");
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: "Your password confirmation is wrong");
      return;
    }

    try {
    var context2 = Navigator.of(context); // how to jump async gap step 1
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        String photoUrl = "uploads/default.png";
        await credential.user?.updatePhotoURL(photoUrl);

        toastInfo(
            msg:
                """An email has been sent to your registered email. 
                To activate it please check your email box 
                and click on the link"""
                );
        // Navigator.of(context).pop();
        (context2).pop(); // how to jump async gap step 2
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: "The password provided is too weak");
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: "The email is already in use");
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: "Your email id is invalid");
      }
    }
  }
}
