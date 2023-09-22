part of 'register_bloc.dart';

abstract class RegisterEvent {
  const RegisterEvent();
}

class UserNameEvent extends RegisterEvent{
  final String userName;
  const UserNameEvent(this.userName);

}
class EmailEvent extends RegisterEvent{
  final String email;
  const EmailEvent(this.email);

}
class PasswordEvent extends RegisterEvent{
  final String password;
  const PasswordEvent(this.password);

}

class RePasswordEvent extends RegisterEvent{
  final String rePassword;
  const RePasswordEvent(this.rePassword);

}