import 'dart:ffi';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_application_12/cubits/symboll_cubit/symboll_cubit.dart';
import 'package:flutter_application_12/cubits/symboll_cubit/symboll_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_12/models/coin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class First extends StatelessWidget {
  String? symbol;
  First({this.symbol
  }) ;

  @override
  Widget build(BuildContext context) {
    SymbolCubit  newas = SymbolCubit();
    newas.streamListener(symbol);
    return 
    BlocBuilder<SymbolCubit, SymbolState>(
  
      builder: (context, state) {
       
        return ConditionalBuilder(
          condition: state is! LoadingState,
          builder: (context) {
            //List<Stream<Map>>? listpulder ;  
            //listpulder!.add(SymbolCubit.get(context).getValueStream());
            return StreamBuilder<Map>(initialData: {"s":"BTCUSDT","p":0},
        stream: newas.getValueStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return  Center(
              child: Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.orange,width: 2)),color: Colors.black ),
                alignment: Alignment.topLeft,
                
                padding: EdgeInsets.all(10),

                child: Column(children: [Text(
                  symbol!.toUpperCase()  ,
                  style: TextStyle(fontSize: 24,color: Colors.white),
                  
                ),
                 Container(child: SizedBox(width: 5,),color: Colors.orange,),Text(
                  
                   newas.temp['p'].toString() ?? '0',
                  style: TextStyle(fontSize: 15, color:     newas.temp!['p'] != null ? double.parse(snapshot.data!['p'].toString()) <  double.parse(newas.temp['p']) ? Colors.red: Colors.green  : Colors.white)  ,
                ),
               
                ],),
              )
            );

              } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
     
             }
            //Text(SymbolCubit.get(context).temp['p'].toString());
            /*ListView.builder(
              itemBuilder: (context, index) {
                
                return NewsItem(myModel: SymbolCubit.get(context).temp[index]);
              },
              itemCount: SymbolCubit.get(context).generaltekir.length,
            );*/
          ,
          fallback: (context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      },
    );
  }
}

class FirstPage extends StatelessWidget {
  String? symbol;
  FirstPage({this.symbol
  }) ;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: Listtiker.length,
      itemBuilder: (context, index) {
      return First(symbol: Listtiker[index]);
    },);
    
  }
}