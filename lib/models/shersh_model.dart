
import 'package:flutter/material.dart';
import 'package:flutter_application_12/models/coin.dart';
import 'package:flutter_application_12/views/home_view.dart';
import 'symbol_model.dart';
import 'package:flutter_application_12/views/news_page.dart';

class SearchModle extends SearchDelegate<String>{
  
  List<String> Listtiker =[];
  SearchModle( this.Listtiker);
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear) ,onPressed: () {
      query ='';
    },)];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () {
      close(context, "");
    }, icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
   return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {

   List<String> newsfilter = [];
   
    if (query.isEmpty){
      newsfilter = Listtiker;
    }else{
      newsfilter = Listtiker.where((element) => element!.contains(query)).toList();
    }
   return ListView.builder(itemBuilder: (context, index) {
     return InkWell(onTap: () {
      Navigatorto(context,Home(sympol: newsfilter[index]));
      
     },child: Container(child: Text('${newsfilter[index]}')));
   },itemCount: newsfilter.length,);
  }

void Navigatorto(BuildContext context,Widget scren){

   Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => scren,transitionsBuilder: (context, animation, secondaryAnimation, child) {
     return FadeTransition(opacity: animation,
     child: child);
   }, ));
}


}