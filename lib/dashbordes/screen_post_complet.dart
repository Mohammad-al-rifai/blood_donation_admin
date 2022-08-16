import 'package:blood_admin/cubit/completed_post/completed_post_cubit.dart';
import 'package:blood_admin/cubit/completed_post/completed_post_states.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import '../models/completed_post/completed_post_model.dart';

class PostCompleteScreen extends StatelessWidget {
  const PostCompleteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context) =>CompletedPostCubit()..getPercentOfCompleted(),
      child: BlocConsumer<CompletedPostCubit,CompletedPostStates>(
        listener: (context, state) {},

      builder: (context, state) {
        return  Scaffold(
          appBar: AppBar(title:  const Text('طلبات التبرع'),),
          body: Center(
            child: (state is GetPostCompletedSuccessState )?
        CircularPercentIndicator(
                radius: 130.0,
                lineWidth: 18,
                percent: state.completedPost.PercentOfComplete/100,
                    center:  Text('%الطلبات التي أكتملت بنسبة ${state.completedPost.PercentOfComplete/100}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                      fontSize: 15.0),),
                progressColor: Colors.green,
              )
                :const Center(child:  CircularProgressIndicator()),
          ),
        );
      }
      ),
      );

  }
}