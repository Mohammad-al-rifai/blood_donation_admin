import 'package:blood_admin/cubit/blood_group_ratio/bloog_group_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/gender_ratio_donate/gender_ratio_donate_cubit.dart';
import '../cubit/gender_ratio_donate/gender_ratio_donate_states.dart';
import '../cubit/gender_ratio_donors/gender_ratio_donors_cubit.dart';
import '../cubit/gender_ratio_donors/gender_ratio_donors_states.dart';

class GenderDonorsScreen extends StatelessWidget {
  const GenderDonorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    return BlocProvider(

      create: (BuildContext context) =>GenderRatioDonorsCubit()..getGenderRatioDonors(),
      child: BlocConsumer<GenderRatioDonorsCubit,GenderRatioDonorsStates>(
          listener: (context, state) {
          },
          builder: (context, state) {

            return  Scaffold(
              appBar: AppBar(title:  const Text('جنس المتبرع لهم'),),
              body: Center(
                child: (state is GetGenderRatioDonorsSuccessState) ?  Container(
                  padding: const EdgeInsets.all( 16),
                  child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'نسبة المتبرعين من الذكور و الإناث',
                        style: TextStyle(
                            color: Color(0xff041b2d),
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0
                        ),
                      ),
                      SizedBox(height: 75.0.h,),
                      PieChart(
                        dataMap: GenderRatioDonorsCubit.get(context).dataMapPlus ,
                        //chartType: ChartType.ring,
                       // baseChartColor: Colors.grey[50]!.withOpacity(0.15),
                        //colorList: colorList,

                        //totalValue: 100,
                        //centerText: "Gender",
                        chartRadius: MediaQuery.of(context).size.width/2,
                      ),
                      SizedBox(height: 75.0.h,),

                    ],
                  ),
                ) : const Center(child:CircularProgressIndicator()),

                ),
              );

          }
      ),
    );

  }

}