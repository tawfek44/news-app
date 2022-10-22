import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/layout/news_layout.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

import 'layout/cubit/block_observer.dart';

void main() {
  DioHelper.init();
  BlocOverrides.runZoned(
        () {
      // Use cubits...
    },
    blocObserver: MyBlocObserver(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) => NewsCubit(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state) =>{
        },
        builder: (context,state) =>MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 0.0,
                backwardsCompatibility:false,
                iconTheme: IconThemeData(
                    color: Colors.black
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark
                ),
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                ),

              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  elevation: 40.0,
                  selectedItemColor: Colors.deepOrange
              ),
              scaffoldBackgroundColor: Colors.white,
              textTheme: const TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                  )
              )

          ),
          darkTheme: ThemeData(
              appBarTheme:  AppBarTheme(
                  backgroundColor: HexColor('333739'),
                  elevation: 0.0,
                  backwardsCompatibility:false,
                  iconTheme: const IconThemeData(
                      color: Colors.white
                  ),
                  systemOverlayStyle: const SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark
                  ),
                  titleTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                  )
              ),
              bottomNavigationBarTheme:BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  elevation: 40.0,
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey,
                  backgroundColor: HexColor('333739')
              ),
              scaffoldBackgroundColor: HexColor('333739'),
              textTheme: const TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                  )
              )

          ),
          themeMode: NewsCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
          home: const NewsLayout(),
        ),
      ),
    );
  }
}
