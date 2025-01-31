import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_application_12/components/news_item.dart';
import 'package:flutter_application_12/cubits/symboll_cubit/symboll_cubit.dart';
import 'package:flutter_application_12/cubits/symboll_cubit/symboll_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    BlocConsumer<SymbolCubit, SymbolState>(
      listener: (context, state) {
        // No implementation needed for now.
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! LoadingState,
          builder: (context) {
            return StreamBuilder<Map>(
        stream: SymbolCubit.get(context).getValueStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Column(children: [Text(
                snapshot.data!['s'].toString(),
                style: TextStyle(fontSize: 24),
              ),Text(
                snapshot.data!['p'].toString(),
                style: TextStyle(fontSize: 24),
              ),],)
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







