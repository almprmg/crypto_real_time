import 'package:crypto/Modle/Crypto_Model.dart';
import 'package:crypto/responc/responc_api.dart';
import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:rxdart/rxdart.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:crypto/server/binane.dart';
part 'coin_event.dart';
part 'coin_state.dart';
/*
class CryptoCurrencyCubit extends Cubit<CryptoCurrencyState> {
  CryptoCurrencyCubit() : super(InitialState());
   final BehaviorSubject<List<CryptoCurrencyModel>> _cryptoCurrencySubject =
      BehaviorSubject<List<CryptoCurrencyModel>>();

  Stream<List<CryptoCurrencyModel>> get cryptoCurrencyStream =>
      _cryptoCurrencySubject.stream;
  List<CryptoCurrencyModel> generaltekir = [];

  List<dynamic> temp = [];
  static CryptoCurrencyCubit get(context) {
    return BlocProvider.of(context);
  } 

  void fetchData( )async {
    
    dynamic response = await CryptoCurrency().getData();
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
        var cryptoCurrencyList = (data as List)
        .map((item) => CryptoCurrencyModel.fromJson(item))
        .toList();
  generaltekir= cryptoCurrencyList;
  print("generaltekir${generaltekir}");
    _cryptoCurrencySubject.add(cryptoCurrencyList);
    emit(SuccessStatae(_cryptoCurrencySubject));
    } else {
      // معالجة الأخطاء في حالة عدم استجابة الخادم بنجاح
      print('Failed to fetch data. Status code: ${response.statusCode}');
    }
      
 
    }
  void dispose() {
    _cryptoCurrencySubject.close();
   
  } 

  }
  
*/
class CoinBloc extends Bloc<CoinEvent, CoinState> {
  CoinBloc(CoinRepository coinRepository) : super(CoinInitial()) {
    final CoinRepository coinRepository = CoinRepository();
    on<CoinEvent>((event, emit) async {
      try {
        if (event is FetchCoinData) {
          emit(CoinLoading());

          try {
            final coins = await coinRepository.getCoins();
            emit(CoinLoaded(coins));
          } catch (e) {
            emit(CoinError(e.toString()));
          }
        }
      } catch (e) {
        emit(CoinError(e.toString()));
      }
    });
  }
}

     

  


  



