
import 'package:blood_admin/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/age_donate/age_donate_model.dart';
import '../../models/gender_donate/gender_donate_model.dart';
import '../../shared/network/end_point.dart';
import 'age_ratio_donate_states.dart';

class AgeRatioDonorsCubit extends Cubit<AgeRatioDonorsStates>{
  AgeRatioDonorsCubit() : super(AppInitial());

  static AgeRatioDonorsCubit get(context) => BlocProvider.of(context);


late AgeDonateModel ageDonateModel;
  late Map<String, double> dataMapPlus;

 getAgeDonors()  async {

      try{
        emit(GetAgeRatioDonorsLoadingState());
        final response = await DioHelper.getData(
            url: Urls.ageDonors
        );
        ageDonateModel= AgeDonateModel.fromJson(response.data);
        dataMapPlus = {
          "youths":ageDonateModel.youths,
          "elderly": ageDonateModel.elderly,
        };
        emit(GetAgeRatioDonorsSuccessState(ageDonateModel:  ageDonateModel));
      }catch(error){

        emit(GetAgeRatioDonorsErrorState(error.toString()));
      }
 }
}

