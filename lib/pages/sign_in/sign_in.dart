import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app_bloc/pages/sign_in/widgets/sign_in_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildThirdPartyLogin(context),
                Center(
                    child: reusableText('Or use your email account to login')),
                Container(
                  margin: EdgeInsets.only(
                    top: 66.h,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText('Email'),
                      SizedBox(
                        height: 5.h,
                      ),
                      buildTextField(
                          'Enter your email address', 'email', 'user'),
                      reusableText('Password'),
                      SizedBox(
                        height: 5.h,
                      ),
                      buildTextField('Enter your password', 'password', 'lock'),
                      SizedBox(
                        height: 5.h,
                      ),
                      forgotPassword(),
                      buildLogInAndRegButton('Log in', 'login'),
                      SizedBox(
                        height: 5.h,
                      ),
                      buildLogInAndRegButton('Register', 'register'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
