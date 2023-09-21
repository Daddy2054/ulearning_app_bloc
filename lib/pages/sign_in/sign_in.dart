import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app_bloc/pages/sign_in/sign_in_controller.dart';
import 'package:ulearning_app_bloc/pages/sign_in/widgets/sign_in_widget.dart';

import 'bloc/sign_in_bloc.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
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
                        child:
                            reusableText('Or use your email account to login')),
                    Container(
                      margin: EdgeInsets.only(
                        top: 36.h,
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
                            'Enter your email address',
                            'email',
                            'user',
                            (value) {
                              context.read<SignInBloc>().add(EmailEvent(value));
                            },
                          ),
                          reusableText('Password'),
                          SizedBox(
                            height: 5.h,
                          ),
                          buildTextField(
                              'Enter your password', 'password', 'lock',
                              (value) {
                            context
                                .read<SignInBloc>()
                                .add(PasswordEvent(value));
                          }),
                          SizedBox(
                            height: 5.h,
                          ),
                          forgotPassword(),
                          buildLogInAndRegButton('Log in', 'login', () {
                            print('login button');
                            SignInController(context: context)
                                .handleSignIn('email');
                          }),
                          SizedBox(
                            height: 5.h,
                          ),
                          buildLogInAndRegButton('Register', 'register', () {
                            Navigator.of(context).pushNamed('register');
                          }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
