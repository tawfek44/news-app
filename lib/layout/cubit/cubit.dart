import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/modules/settings/settings_screen.dart';

import '../../modules/business/business_screen.dart';
import '../../modules/science/science_screen.dart';
import '../../modules/sports/sports_screen.dart';
import '../../shared/network/remote/dio_helper.dart';
class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit():super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int bottomNavBarItems=0;

  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
        icon:Icon(Icons.business),
        label: 'Business'
    ),
    const BottomNavigationBarItem(
        icon:Icon(Icons.sports),
        label: 'Sports',
    ),
    const BottomNavigationBarItem(
        icon:Icon(Icons.science),
        label: 'Science'
    ),
    const BottomNavigationBarItem(
        icon:Icon(Icons.settings),
        label: 'Settings'
    )
  ];
   List<Widget>  screens=const[
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen()
  ];
  void bottomNavBarOnTap(int index){
    bottomNavBarItems=index;
    emit(ChangeBottomNavBarState());
  }

  var business=[];
  void getBusinessNews(){
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
        urlPath: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'business',
          'apiKey':'bb505f67c887401c897ba16a3675d404'
        }).then((value) {
          business=value.data['articles'];
          emit(NewsGetBusinessSuccessState());
    }).catchError((error){
      emit(NewsGetBusinessErrorState(error));
      print(error.toString());
    });
  }

  var sports=[];
  void getSportsNews(){
    emit(NewsGetSportsLoadingState());
    DioHelper.getData(
        urlPath: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'sports',
          'apiKey':'bb505f67c887401c897ba16a3675d404'
        }).then((value) {
      sports=value.data['articles'];
      emit(NewsGetSportsSuccessState());
    }).catchError((error){
      emit(NewsGetSportsErrorState(error));
      print(error.toString());
    });
  }

  var science=[];
  void getScienceNews(){
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(
        urlPath: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'science',
          'apiKey':'bb505f67c887401c897ba16a3675d404'
        }).then((value) {
      science=value.data['articles'];
      emit(NewsGetScienceSuccessState());
    }).catchError((error){
      emit(NewsGetScienceErrorState(error));
      print(error.toString());
    });
  }


  bool isDark=false;
  void changeMode(){
    isDark=!isDark;
    emit(NewsChangeModeState());
  }
}
