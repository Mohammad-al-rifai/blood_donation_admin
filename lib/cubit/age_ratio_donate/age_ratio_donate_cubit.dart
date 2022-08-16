
import 'package:blood_admin/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/age_donate/age_donate_model.dart';
import '../../models/gender_donate/gender_donate_model.dart';
import '../../shared/network/end_point.dart';
import 'age_ratio_donate_states.dart';

class AgeRatioDonateCubit extends Cubit<AgeRatioDonateStates>{
  AgeRatioDonateCubit() : super(AppInitial());

  static AgeRatioDonateCubit get(context) => BlocProvider.of(context);


late AgeDonateModel ageDonateModel;
  late Map<String, double> dataMapPlus;

 getAgeDonate()  async {

      try{
        emit(GetAgeRatioDonateLoadingState());
        final response = await DioHelper.getData(
            url: Urls.ageDonate
        );
        ageDonateModel= AgeDonateModel.fromJson(response.data);
        dataMapPlus = {
          "youths":ageDonateModel.youths,
          "elderly": ageDonateModel.elderly,
        };
        emit(GetAgeRatioDonateSuccessState(ageDonateModel:  ageDonateModel));
      }catch(error){

        emit(GetAgeRatioDonateErrorState(error.toString()));
      }
 }
}

