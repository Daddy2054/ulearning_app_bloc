// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

// part 'welcome_event.dart';
// part 'welcome_state.dart';

// class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
//   WelcomeBloc() : super(WelcomeInitial()) {
//     on<WelcomeEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }
import 'package:flutter_bloc/flutter_bloc.dart';

import 'welcome_event.dart';
import 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeState()) {
    print('welcome bloc');
    on<WelcomeEvent>((event, emit) {
      emit(WelcomeState(page: state.page));
    });
  }
}
