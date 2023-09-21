// part of 'sign_in_bloc.dart';

// @immutable
// sealed class SignInEvent {}

abstract class SignInEvent{
  const SignInEvent();
}

class EmailEvent extends SignInEvent{
  final String email;
  const EmailEvent(this.email);
}

class PasswordEvent extends SignInEvent {
final String password;
const PasswordEvent(this.password);
}