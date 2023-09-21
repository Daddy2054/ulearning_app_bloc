import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          print('email is empty');
        }
        if (password.isEmpty) {
          print('password is empty');

        }
        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
          if (credential.user == null) {
            ///
          }
          if (!credential.user!.emailVerified) {
//
          }
          var user = credential.user;
          if (user != null) {
            //we got verified user from firebase
          } else {
            //error getting user from firebase
          }
        }  on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            print('No user found for that email.');
   //         toastInfo(msg: "No user found for that email");
           // toastInfo(msg: "No user found for that email.");
          } else if (e.code == 'wrong-password') {
            print('Wrong password provided for that user.');
     //       toastInfo(msg: "Wrong password provided for that user");
           // toastInfo(msg: "Wrong password provided for that user.");
          }else if(e.code=='invalid-email'){
            print("Your email format is wrong");
       //     toastInfo(msg: "Your email address format is wrong");
          }
        }
      }
    } catch (e) {}
  }
}
