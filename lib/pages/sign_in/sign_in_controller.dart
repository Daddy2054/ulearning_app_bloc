import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app_bloc/common/values/constant.dart';
import 'package:ulearning_app_bloc/common/widgets/flutter_toast.dart';
import 'package:ulearning_app_bloc/global.dart';
import 'package:ulearning_app_bloc/pages/sign_in/bloc/sign_in_bloc.dart';

class SignInController {
  final BuildContext context;

  SignInController({required this.context});

  void handleSignIn(String type) async {
    try {
      if (type == 'email') {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          toastInfo(msg: 'email is empty');
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: 'password is empty');
          return;
        }
        try {
          var context2 = Navigator.of(context);
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
          if (credential.user == null) {
            toastInfo(msg: "You don't exist");
            return;
          }
          if (!credential.user!.emailVerified) {
            toastInfo(msg: "You need to verify your email account");

            return;
          }
          var user = credential.user;
          if (user != null) {
            //we got verified user from firebase

            if (kDebugMode) {
              print('user exist');
            }
            String? displayName = user.displayName;
            String? email = user.email;
            String? id = user.uid;
            String? photoUrl = user.photoURL;

            // if (kDebugMode) {
            //   print('user open_id $id');
            //   print('user photourl $photoUrl');
            // }
            Global.storageService.setString(
              AppConstants.STORAGE_USER_TOKEN_KEY,
              '11111',
            );
            context2.pushNamedAndRemoveUntil('/application', (route) => false);
          } else {
            //error getting user from firebase
            toastInfo(msg: "Currently you are not a user of this app");
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(msg: 'No user found for that email.');
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: 'Wrong password provided for that user.');
          } else if (e.code == 'invalid-email') {
            toastInfo(msg: "Your email format is wrong");
          }
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
