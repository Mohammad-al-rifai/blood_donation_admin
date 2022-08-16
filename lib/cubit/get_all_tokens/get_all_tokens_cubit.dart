
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/get_all_tokens/get_all_token_model.dart';
import '../../shared/network/end_point.dart';
import '../../shared/network/remote/dio_helper.dart';
import 'get_all_tokens_states.dart';

class GetAllTokensCubit extends Cubit<GetAllTokensStates> {
  GetAllTokensCubit() : super(GetAllTokensLoadingState());

  static GetAllTokensCubit get(context) => BlocProvider.of(context);

  //late NotificationModel notificationModel;
late List<String> tokens;
late GetAllTokensModel getAllTokensModel;
  getAllTokens() async {
    try {
      emit(GetAllTokensLoadingState());
      tokens=[];
      final response = await DioHelper.getData(
        url: Urls.getAllTokens,
      );
      response.data['users'].forEach((element){
       // print(element['tokenPh']);
       tokens.add(element['tokenPh']);
      });
   //  getAllTokensModel = GetAllTokensModel.fromJson(response.data);
      tokens.forEach((element) {
        print("????????????????????????????????????????????????");
        print(element);
        print("????????????????????????????????????????????????");


      });

      emit(GetAllTokensSuccessState(tokens: tokens));
    } catch (error) {
      print(error);
      emit(GetAllTokensErrorState(error.toString()));

    }
  }

}
