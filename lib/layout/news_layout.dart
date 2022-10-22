import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

import 'cubit/states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBusinessNews()..getSportsNews()..getScienceNews(),
      child: BlocConsumer<NewsCubit,NewsStates>(
       builder: (context,state) {
         var newsCubit= NewsCubit.get(context);
         return  Scaffold(
           appBar: AppBar(title: const Text('News App'),
             actions:
           [
             IconButton(onPressed: (){}, icon:const Icon(Icons.search)),
             IconButton(
                 onPressed: (){
                   NewsCubit.get(context).changeMode();
                 },
                 icon:const Icon(Icons.brightness_4_outlined)
             ),
           ],),
           bottomNavigationBar: BottomNavigationBar(
             items: newsCubit.items,
             currentIndex: newsCubit.bottomNavBarItems,
             onTap: (index){
               newsCubit.bottomNavBarOnTap(index);
             },

           ),
           body: newsCubit.screens[newsCubit.bottomNavBarItems],
         );
       },
        listener: (context,state){},
      ),
    );
  }

}
