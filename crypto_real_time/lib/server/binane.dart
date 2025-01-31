// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'package:crypto/Modle/Crypto_Model.dart';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';

class NetworkService {
  final Dio _dio = Dio();

  Future<Response> get(String url) async {
    try {
      return await _dio.get(url);
   } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw ('Connection timeout');
      } else if (e.type == DioExceptionType.badResponse) {
        throw ('Server error: ${e.response?.statusCode}');
      } else {
        throw ('An error occurred');
      }}
  }

  
}
/*
class CryptoCurrency {
  final String url = 'https://stream.binance.com:9443/ws/btcusdt@ticker';
 
  Future<Response> getData() async {
    var response = await http.get(Uri.parse(url),headers: {"method": "SUBSCRIBE", "params": '["btcusdt@ticker", "ethusdt@ticker"]', "id": '1'});
      print("response ${response.body}");
    return response;
  }

  void dispose(_cryptoCurrencySubject ) {
    _cryptoCurrencySubject.close();
  }
}*/