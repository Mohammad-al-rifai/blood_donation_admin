import 'package:blood_admin/cubit/blood_group_ratio/bloog_group_states.dart';
import 'package:blood_admin/cubit/completed_post/completed_post_cubit.dart';
import 'package:blood_admin/cubit/completed_post/completed_post_states.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/blood_group_ratio/blood_group_cubit.dart';
class BloodGroupRatioScreen extends StatelessWidget {
  const BloodGroupRatioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    return BlocProvider(

      create: (BuildContext context) =>BloodGroupCubit()..getBloodGroupRatio(),
      child: BlocConsumer<BloodGroupCubit,BloodGroupStates>(
          listener: (context, state) {
          },
          builder: (context, state) {

            return  Scaffold(
              appBar: AppBar(title:  const Text('زمر الدم'),),
              body: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Center(
                  child: (state is GetBloodGroupRatioSuccessState) ? Container(
                padding: const EdgeInsets.all( 16),
                child: Column(
                  children: [
                    const Text(
                      'زمر الدم الإيجابية',
                      style: TextStyle(
                          color: Color(0xff041b2d),
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0
                      ),
                    ),
                    SizedBox(height: 75.0.h,),
                    PieChart(
                      dataMap: BloodGroupCubit.get(context).dataMapPlus,
                      chartType: ChartType.ring,
                      baseChartColor: Colors.grey[50]!.withOpacity(0.15),
                      //colorList: colorList,
                      chartValuesOptions: const ChartValuesOptions(
                        showChartValuesInPercentage: true,
                      ),
                      totalValue: 100,
                    ),
                    SizedBox(height: 75.0.h,),
                    const Text(
                      'زمر الدم السلبية',
                      style: TextStyle(
                          color: Color(0xff041b2d),
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0
                      ),
                    ),
                    PieChart(
                      dataMap:  BloodGroupCubit.get(context).dataMapMinus,
                      chartType: ChartType.ring,
                      baseChartColor: Colors.grey[50]!.withOpacity(0.15),
                      //colorList: colorList,
                      chartValuesOptions: ChartValuesOptions(
                        showChartValuesInPercentage: true,
                      ),
                      totalValue: 100,
                    ),
                  ],
                ),
                  ) : const Center(child:CircularProgressIndicator()),

                  ),
              ),
              );

          }
      ),
    );

  }
}