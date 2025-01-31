class CryptoCurrencyModel {
  String? name;
  double? price;

  CryptoCurrencyModel({required this.name,required this.price});

  CryptoCurrencyModel.fromJson(Map<String, dynamic> json,) {
    name = json['e'];
    price = json['p'];

  }
}


