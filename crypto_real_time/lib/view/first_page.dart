import 'package:crypto/Modle/Crypto_Model.dart';
import 'package:crypto/bloc/coin_bloc.dart';
import 'package:crypto/view/coin_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto/bloc/coin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto/responc/responc_api.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => CoinBloc(CoinRepository())..add(FetchCoinData()),
  child:BlocConsumer<CoinBloc, CoinState>(
        builder: (context, state) {
          if (state is CoinInitial) {
              print("CoinInitial $CoinInitial");
            return const SizedBox();
          } else if (state is CoinLoading) {
            print(CoinLoading);
            
            return  Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CoinLoaded) {
            print(CoinLoaded);
            return ListView.builder(
              itemCount: state.coins.length,
              itemBuilder: (context, index) {
                print("coin ${state.coins[index]}");
                final coin = state.coins[index];
                return CoinList(
                  coin: coin,
                  onTap: () {
                   //
                  },
                );
              },
            );
          } else {
            return const Center(
              child: Text('Error Occured'),
            );
          }
        }, listener: (BuildContext context, CoinState state) { 
          //
         },
    ));
    }
}
/*

class CryptoCurrencyScreenState extends StatelessWidget {
 
  final CryptoCurrencyCubit bloc = CryptoCurrencyCubit();
  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) => CryptoCurrencyCubit()..fetchData(),
      child: BlocConsumer<CryptoCurrencyCubit, CryptoCurrencyState>(
        bloc: bloc,
        listener: (context, state) {
          
        },
        builder: (context, state) {
            if (state != LoadingState) {
              
             // عرض قائمة العملات المشفرة هنا
              return ListView.builder(
                itemCount:  CryptoCurrencyCubit.get(context).generaltekir.length,
                itemBuilder: (context, index) {
                 
                  return ListTile(
                    title: Text( CryptoCurrencyCubit.get(context).generaltekir[index].toString()),
                    subtitle: Text("1"),
                  );
                },
              );
            } else if (state != ErrorState) {
              return Text('Error: ${ErrorState}');
            } else {
              return Center(child: CircularProgressIndicator());
        }},
      ),
    );
  
  }

}
/*body: StreamBuilder<List<CryptoCurrencyModel>>(
        stream: _bloc.cryptoCurrencyStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final cryptoCurrencies = snapshot.data;
           // عرض قائمة العملات المشفرة هنا
            return ListView.builder(
              itemCount: cryptoCurrencies.length,
              itemBuilder: (context, index) {
                final currency = cryptoCurrencies[index];
                return ListTile(
                  title: Text(currency.name),
                  subtitle: Text(currency.price.toString()),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );*/
*/


