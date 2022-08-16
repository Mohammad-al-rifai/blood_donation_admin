import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dashbordes/screen_blood_group.dart';
import '../../models/blod_group_ratio/blood_group_model.dart';
import '../../shared/network/end_point.dart';
import '../../shared/network/remote/dio_helper.dart';
import 'bloog_group_states.dart';

class BloodGroupCubit extends Cubit<BloodGroupStates> {
  BloodGroupCubit() : super(GetBloodGroupRatioInitialState());

  static BloodGroupCubit get(context) => BlocProvider.of(context);
  late BloodGroupRatioModel bloodGroupRatio;
 late Map<String, double> dataMapPlus;
 late Map<String, double> dataMapMinus;
  getBloodGroupRatio()  async {

    try{
      emit(GetBloodGroupRatioLoadingState());
      final response = await DioHelper.getData(
          url: Urls.bloodGroupRatio
      );
     bloodGroupRatio= BloodGroupRatioModel.fromJson(response.data);
      dataMapPlus = {
        "AB+": bloodGroupRatio.AB_plus,
        "A+": bloodGroupRatio.A_plus,
        "B+": bloodGroupRatio.B_plus,
        "O+": bloodGroupRatio.O_plus,
        "Blasma": bloodGroupRatio.Blasma,
      };
      dataMapMinus = {
        "AB-": bloodGroupRatio.AB_minus,
        "A-": bloodGroupRatio.A_minus,
        "B-": bloodGroupRatio.B_minus,
        "O-": bloodGroupRatio.O_minus,

      };
      emit(GetBloodGroupRatioSuccessState());
    }catch(error){
      print(error.toString());
      emit(GetBloodGroupRatioErrorState(error.toString()));
    }








  }


}