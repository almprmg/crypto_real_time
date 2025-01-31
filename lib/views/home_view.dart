

import 'package:flutter/services.dart';
import 'package:flutter_application_12/cubits/app_cubit/app_cubit.dart';
import 'package:flutter_application_12/cubits/app_cubit/app_cubit_state.dart';
import 'package:flutter_application_12/cubits/nav_bar_cubit/nav_bar_cubit.dart';
import 'package:flutter_application_12/cubits/nav_bar_cubit/nav_bar_states.dart';
import 'package:flutter_application_12/cubits/symboll_cubit/symboll_cubit.dart';
import 'package:flutter_application_12/cubits/symboll_cubit/symboll_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_12/models/coin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_12/models/shersh_model.dart';

class Home extends StatelessWidget {
  String ?sympol ;

  Home({required this.sympol});
  @override
  Widget build(BuildContext context) {
  


    return BlocProvider(
      create: (context) => SymbolCubit()..streamListener(sympol),
      child: BlocProvider(
          create: (context) => NavBarCubit(),
          child: BlocConsumer<AppCubit, AppStates>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return BlocConsumer<SymbolCubit, SymbolState>(
                builder: (context, state) {
                  return BlocConsumer<NavBarCubit, NavBarStates>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      var cubit = NavBarCubit.get(context);
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
                                  SymbolCubit.get(context).getalltekir();

                                  showSearch(
                                      context: context,
                                      delegate: SearchModle(
                                         Listtiker));
                                },
                                icon: const Icon(Icons.search)),
                          ],
                        ),
                        body: cubit.pages[cubit.currentIndex],
                        floatingActionButton:
                            FloatingActionButton(onPressed: () {
                          //;
                        }),
                        bottomNavigationBar: BottomNavigationBar(
                            currentIndex: cubit.currentIndex,
                            onTap: (value) {
                              cubit.changeBar(value);
                            },
                            items: const [
                              BottomNavigationBarItem(
                                  icon: Icon(Icons.sports), label: 'first'),
                              BottomNavigationBarItem(
                                  icon: Icon(Icons.business), label: 'second'),
                              BottomNavigationBarItem(
                                  icon: Icon(Icons.settings), label: 'third'),
                            ]),
                      );
                    },
                  );
                },
                listener: (context, state) {},
              );
            },
          )),
    );
  }
}
