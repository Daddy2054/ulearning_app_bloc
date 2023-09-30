import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ulearning_app_bloc/common/entities/user.dart';
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

            LoginRequestEntity loginRequestEntity = LoginRequestEntity();
            loginRequestEntity.avatar = photoUrl;
            loginRequestEntity.name = displayName;
            loginRequestEntity.email = email;
            loginRequestEntity.open_id = id;
            //type 1 means email login
            loginRequestEntity.type = 1;

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

    Future<void> asyncPostAllData(
      LoginRequestEntity loginRequestEntity,
    ) async {
      EasyLoading.show(
          indicator: const CircularProgressIndicator(),
          maskType: EasyLoadingMaskType.clear,
          dismissOnTap: true);
      // var result = await UserAPI.login(
      //   params: loginRequestEntity,
      // );
      // if (result.code == 200) {
      //   try {
      //     Global.storageService.setString(
      //       AppConstants.STORAGE_USER_PROFILE_KEY,
      //       jsonEncode(result.data!),
      //     );
      //     if (kDebugMode) {
      //       print("......my token is ${result.data!.access_token!}.......");
      //     }
      //     //used for authorization
      //     Global.storageService.setString(
      //       AppConstants.STORAGE_USER_TOKEN_KEY,
      //       result.data!.access_token!,
      //     );
      //     EasyLoading.dismiss();

      //     if (context.mounted) {
      //       Navigator.of(context)
      //           .pushNamedAndRemoveUntil("/application", (route) => false);
      //     }
      //   } catch (e) {
      //     if (kDebugMode) {
      //       print("saving local storage error ${e.toString()}");
      //     }
      //   }
      // } else {
      //   EasyLoading.dismiss();
      //   toastInfo(msg: "unknown error");
      // }
    }
  }
}
