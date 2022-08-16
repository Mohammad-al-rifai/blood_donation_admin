
import 'package:blood_admin/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/gender_donate/gender_donate_model.dart';
import '../../shared/network/end_point.dart';
import 'gender_ratio_donate_states.dart';

class GenderRatioDonateCubit extends Cubit<GenderRatioDonateStates>{
  GenderRatioDonateCubit() : super(AppInitial());

  static GenderRatioDonateCubit get(context) => BlocProvider.of(context);


late GenderDonateModel genderDonateModel;
  late Map<String, double> dataMapPlus;

 getGenderRatioDonate()  async {

      try{
        emit(GetGenderRatioDonateLoadingState());
        final response = await DioHelper.getData(
            url: Urls.genderDonate
        );
        genderDonateModel= GenderDonateModel.fromJson(response.data);
        dataMapPlus = {
          "Male":genderDonateModel.Male,
          "Famale": genderDonateModel.Famale,
        };
        emit(GetGenderRatioDonateSuccessState(genderDonateModel: genderDonateModel));
      }catch(error){
        print(error.toString());
        print("-------------------------------");
        print(dataMapPlus);
        emit(GetGenderRatioDonateErrorState(error.toString()));
      }
 }
}

