part of 'register_bloc.dart';

//@immutable
//sealed
class RegisterState {
  final String userName;
  final String email;
  final String password;
  final String rePassword;

  //optional named parameter
  const RegisterState({
    this.userName = "",
    this.email = "",
    this.password = "",
    this.rePassword = "",
  });

  RegisterState copyWith({
    String? userName,
    String? email,
    String? password,
    String? rePassword,
  }) {
    return RegisterState(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      rePassword: rePassword ?? this.rePassword,
    );
  }
}

//final class RegisterInitial extends RegisterState {}
