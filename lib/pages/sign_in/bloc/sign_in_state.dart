//part of 'sign_in_bloc.dart';

//@immutable
//sealed
class SignInState {
  final String email;
  final String password;

  const SignInState({
    this.email = '',
    this.password = '',
  });

  SignInState copyWith({String? email, String? password}) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}

//final class SignInInitial extends SignInState {}
