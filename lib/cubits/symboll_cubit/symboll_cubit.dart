
import 'dart:convert';

import 'package:flutter_application_12/cubits/symboll_cubit/symboll_states.dart';
import 'package:flutter_application_12/models/symbol_model.dart';
import 'package:flutter_application_12/services/websocket_binance.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SymbolCubit extends Cubit<SymbolState> {
  SymbolCubit() : super(InitialState());

  List<SymbolModel> generaltekir = [];
  
  Map temp = {};
  static SymbolCubit get(context) {
    return BlocProvider.of(context);
  } 
  streamListener(Symbol {
    dynamic channel = Websocket_binance().getResponse(Symbol);
    
    channel.stream.listen((message) {
      // channel.sink.add('received!');
      // channel.sink.close(status.goingAway);
      temp = jsonDecode(message);
      emit(SuccessStatae());

       print(temp);
    });
  }


Stream<Map> getValueStream() {
  
    return Stream.periodic(Duration(seconds:1 ), (count) {
      emit(ChagnedStatae());
      return temp;
      
    });
    
    
  }
  

  
List<SymbolModel> alltiker = [];
  void getalltekir(){

    alltiker = generaltekir;

  }
  
  }

