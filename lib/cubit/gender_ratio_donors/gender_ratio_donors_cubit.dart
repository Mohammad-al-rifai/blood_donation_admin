
import 'package:blood_admin/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/gender_donate/gender_donate_model.dart';
import '../../shared/network/end_point.dart';
import 'gender_ratio_donors_states.dart';

class GenderRatioDonorsCubit extends Cubit<GenderRatioDonorsStates>{
  GenderRatioDonorsCubit() : super(AppInitial());

  static GenderRatioDonorsCubit get(context) => BlocProvider.of(context);


late GenderDonateModel genderDonateModel;
  late Map<String, double> dataMapPlus;

 getGenderRatioDonors()  async {

      try{
        emit(GetGenderRatioDonorsLoadingState());
        final response = await DioHelper.getData(
            url: Urls.genderDonors
        );
        genderDonateModel= GenderDonateModel.fromJson(response.data);
        dataMapPlus = {
          "Male":genderDonateModel.Male,
          "Famale": genderDonateModel.Famale,
        };
        emit(GetGenderRatioDonorsSuccessState(genderDonateModel: genderDonateModel));
      }catch(error){
        print(error.toString());
        print("-------------------------------");
        print(dataMapPlus);
        emit(GetGenderRatioDonorsErrorState(error.toString()));
      }
 }
}

