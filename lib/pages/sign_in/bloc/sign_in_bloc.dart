
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<EmailEvent>((event, state ) {
      // TODO: implement event handler
    });
        on<PasswordEvent>((event, state ) {
      // TODO: implement event handler
    });

  }
}
