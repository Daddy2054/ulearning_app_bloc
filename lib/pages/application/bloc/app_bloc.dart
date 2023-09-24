

import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBlocs extends Bloc<AppEvent, AppState>{
   AppBlocs():super(const AppState()){
     on<TriggerAppEvent>((event, emit){
       emit(AppState(index:event.index));
     });
   }

}
