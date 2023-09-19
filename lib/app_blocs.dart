import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app_bloc/app_events.dart';
import 'package:ulearning_app_bloc/app_states.dart';

class AppBlocs extends Bloc<AppEvents, AppStates> {
  // AppBlocs(super.initialState);
  AppBlocs() : super(InitStates()) {
    print('app bloc');

    on<Increment>(
      (event, emit) {
        emit(AppStates(counter: state.counter+1));
        print(state.counter);
      },
    ); 
    on<Decrement>(
      (event, emit) {
        emit(AppStates(counter: state.counter-1));
        print(state.counter);
      },
    );
  }
}
