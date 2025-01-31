

class SymbolModel {

  String? symbol;

  String? price;
  String? image;



  SymbolModel({required this.symbol, required this.price,required this.image});
   SymbolModel.fromJson(Map<dynamic, dynamic> json,) {
    symbol = json['e'];
    price = json['p'];

  }
}
