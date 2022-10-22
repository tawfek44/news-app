import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../../shared/components/components/components.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit,NewsStates>(
      listener:(context,state){} ,
      builder: (context,state){
        return ConditionalBuilder(
          condition: NewsCubit.get(context).science.isNotEmpty,
          builder: (context){
            return ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context,index){
                  return newsItem(NewsCubit.get(context).science,index,context);
                },
                separatorBuilder: (context,index) => const Divider(),
                itemCount: NewsCubit.get(context).science.length
            );
          },
          fallback: (context) =>const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
