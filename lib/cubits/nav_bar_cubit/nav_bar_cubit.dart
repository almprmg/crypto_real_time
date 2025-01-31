import 'package:flutter_application_12/cubits/nav_bar_cubit/nav_bar_states.dart';
import 'package:flutter_application_12/views/first_page.dart';
import 'package:flutter_application_12/views/second_page.dart';
import 'package:flutter_application_12/views/third_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavBarCubit extends Cubit<NavBarStates> {
  NavBarCubit() : super(InitialNavBarState());

  static NavBarCubit get(context) {
    return BlocProvider.of(context);
  }

  int currentIndex = 0;
  void changeBar(int value) {
    currentIndex = value;
    emit(ChangeNavBar());
  }

  List<Widget> pages = [
    FirstPage(),
    SecondPage(),
    ThirdPage()
  ];
}
