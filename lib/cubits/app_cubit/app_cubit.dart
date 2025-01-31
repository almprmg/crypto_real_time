
import 'package:flutter_application_12/cubits/app_cubit/app_cubit_state.dart';
import 'package:flutter_application_12/main.dart';


import 'package:flutter_bloc/flutter_bloc.dart';
class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialAppState());

  static AppCubit get(context) {
    return BlocProvider.of(context);
  }
  bool dark =false;
  void Change_MODE(){
    dark = !dark;
    mybox!.put("mode",dark);
    emit(Change_mode());

  }
  
  }