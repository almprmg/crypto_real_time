import 'package:crypto/Modle/Crypto_Model.dart';
import 'package:crypto/server/binane.dart';

class CoinRepository {
  final NetworkService _response =  NetworkService();
     Future<List<CryptoCurrencyModel>> getCoins() async {
    try {
      final response = await _response.get('https://stream.binance.com:9443/ws/btcusdt@ticker');
       print("coins{$response}");
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final coins = data.map((e) => CryptoCurrencyModel.fromJson(e)).toList();
       
        return coins;
      } else {
        throw 'Error';
      }
    } on Exception catch (e) {
      print("nrwedsa d ${e.toString()}");
      throw e.toString();
    }

}}