import 'package:flutter/material.dart';
import 'package:flutter_application_12/models/symbol_model.dart';
class NewsPage extends StatelessWidget {
static String NewsPageId = '/news';
 SymbolModel? newtiker;
  NewsPage(this.newtiker);
  @override
  Widget build(BuildContext context) {
   return Scaffold(appBar: AppBar(),body: Center(child: Column(children: [Text('${newtiker!.symbol}',),Text('${newtiker!.price}')]),),);
  }
}


