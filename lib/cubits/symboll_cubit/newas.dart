
import 'dart:async';
import 'dart:convert';

import 'package:flutter_application_12/cubits/symboll_cubit/symboll_states.dart';
import 'package:flutter_application_12/models/symbol_model.dart';
import 'package:flutter_application_12/services/websocket_binance.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class MyStreamController {
  final StreamController<String> _streamController = StreamController<String>();

  Stream<String> get myStream => _streamController.stream;

  MyStreamController() {
    // قم بتحديث البيانات بشكل دوري هنا
    // يمكنك استبداله بمنطق الحصول على البيانات الخاص بك
    Timer.periodic(Duration(seconds: 1), (timer) {
      String newData = DateTime.now().toString();
      _streamController.add(newData);
    });
  }

  void dispose() {
    _streamController.close();
  }
}
class Controller extends GetxController {
 

  List<SymbolModel> generaltekir = [];

  Map temp = {}.obs;
streamListener() {
    dynamic channel = Websocket_binance().getResponse('');
    channel.stream.listen((message) {
      // channel.sink.add('received!');
      // channel.sink.close(status.goingAway);
      temp = jsonDecode(message);

       print(temp['p']);
    });
  }
  void getData( ) {
    
    var Socketswa =  Websocket_binance().getResponse('');
    

      
 
    }
     

  

  
List<SymbolModel> alltiker = [];
  void getalltekir(){

    alltiker = generaltekir;

  }
  
  }

