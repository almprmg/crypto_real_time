

import 'package:flutter/services.dart';
import 'package:flutter_application_12/cubits/app_cubit/app_cubit.dart';
import 'package:flutter_application_12/cubits/app_cubit/app_cubit_state.dart';
import 'package:flutter_application_12/cubits/symboll_cubit/symboll_cubit.dart';
import 'package:flutter_application_12/cubits/symboll_cubit/symboll_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_12/models/coin.dart';
import 'package:flutter_application_12/views/first_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_12/models/shersh_model.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  


    return BlocProvider(
      create: (context) => SymbolCubit(),
      child: BlocProvider(
          create: (context) => AppCubit(),
          child: BlocConsumer<AppCubit, AppStates>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return BlocConsumer<SymbolCubit, SymbolState>(
                builder: (context, state) {
                  return Scaffold(
                        appBar: AppBar(
                          title: Text('CounterApp'),
                          backgroundColor:
                              const Color.fromARGB(255, 43, 101, 148),
                          leading: IconButton(
                            icon: Icon(Icons.night_shelter),
                            onPressed: () {
                              AppCubit.get(context).Change_MODE();
                            },
                          ),
                          actions: [
                            IconButton(
                                onPressed: () {
    
                                  showSearch(
                                      context: context,
                                      delegate: SearchModle(
                                         Listtiker));
                                },
                                icon: const Icon(Icons.search)),
                          ],
                        ),
                        body: FirstPage(),
                      );},
                listener: (context, state) {},
              );
            },
          )),
    );
  }
}
