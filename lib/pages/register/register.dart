import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_widgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                         //     context.read<SignInBloc>().add(EmailEvent(value));
                            },
                          ),
                          reusableText('Password'),
                          SizedBox(
                            height: 5.h,
                          ),
                          buildTextField(
                              'Enter your password', 'password', 'lock',
                              (value) {
                            // context
                            //     .read<SignInBloc>()
                            //     .add(PasswordEvent(value));
                          }),
                          SizedBox(
                            height: 5.h,
                          ),
                          forgotPassword(),
                 
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
     
  }
}
