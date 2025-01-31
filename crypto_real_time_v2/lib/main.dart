import 'package:flutter_application_12/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_12/cubits/app_cubit/app_cubit.dart';
import 'package:flutter_application_12/cubits/app_cubit/app_cubit_state.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
//import 'package:flutter_application_12/views/newas1.dart';

Box? mybox;
Future<Box> OpenHivBox(String box) async{
  WidgetsFlutterBinding.ensureInitialized();
  var dir = await getApplicationDocumentsDirectory() ;
  Hive.init(dir.path);
  return await Hive.openBox(box);
}
void main()async{
 await Hive.initFlutter();

  Bloc.observer = MyBlocObserver();
  
  mybox = await OpenHivBox("mybox");


  runApp(const MyApp());


}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return 
    BlocProvider(
        create: (context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return MaterialApp(
                  //theme: mybox!.get("mode",defaultValue: false) ? ThemeData.dark() : ThemeData.light(),
                  routes: {},
                  debugShowCheckedModeBanner: false,
                  title: 'counter app',
                  home: Home());
            }));
              }
}

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('onEvent -- ${bloc.runtimeType}, $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('onTransition -- ${bloc.runtimeType}, $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- ${bloc.runtimeType}');
  }
}
