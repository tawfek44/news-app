import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/shared/components/components/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(context,state){} ,
      builder: (context,state){
        return ConditionalBuilder(
          condition: NewsCubit.get(context).business.isNotEmpty,
          builder: (context){
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
                itemBuilder: (context,index){
                  return newsItem(NewsCubit.get(context).business,index,context);
                },
                separatorBuilder: (context,index) => const Divider(),
                itemCount: NewsCubit.get(context).business.length
            );
          },
          fallback: (context) =>const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

