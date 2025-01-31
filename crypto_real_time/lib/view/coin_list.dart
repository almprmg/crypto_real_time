import 'package:flutter/material.dart';
import '../Modle/Crypto_Model.dart';

class CoinList extends StatelessWidget {
  const CoinList({super.key, required this.coin, required this.onTap});

  final CryptoCurrencyModel? coin;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(coin!.name!, style: const TextStyle(color: Colors.white)),
      subtitle: Text(
        coin!.name!,
        style: const TextStyle(color: Colors.white),
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        child: Text(coin!.price.toString()),
      ),
      trailing: Text(
        coin!.name == true ? 'Active' : 'Inactive',
        style: TextStyle(
          color: coin!.name == true ? Colors.green : Colors.red,
        ),
      ),
    );
  }
}
