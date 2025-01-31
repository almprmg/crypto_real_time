
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_application_12/components/news_item.dart';
import 'package:flutter_application_12/cubits/symboll_cubit/symboll_cubit.dart';
import 'package:flutter_application_12/cubits/symboll_cubit/symboll_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> type =  ["BNBUSDT"];
    //SymbolCubit.get(context).getData(type);
    return 
    BlocConsumer<SymbolCubit, SymbolState>(
      listener: (context, state) {
        // No implementation needed for now.
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! LoadingState,
          builder: (context) {
            var news =SymbolCubit.get(context).generaltekir.where((element) => element.symbol!.contains("BNBUSDT")).toList();
            return ListView.builder(
              itemBuilder: (context, index) {
                return ;//NewsItem(myModel: news[index]);
              },
              itemCount: news.length,
            );
          },
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







