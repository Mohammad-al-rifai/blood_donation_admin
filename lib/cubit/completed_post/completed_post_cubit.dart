
import 'package:blood_admin/cubit/blood_group_ratio/bloog_group_states.dart';
import 'package:blood_admin/shared/components/components.dart';
import 'package:blood_admin/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/completed_post/completed_post_model.dart';
import '../../shared/components/constants.dart';
import '../../shared/network/end_point.dart';
import 'completed_post_states.dart';

class CompletedPostCubit extends Cubit<CompletedPostStates>{
  CompletedPostCubit() : super(AppInitial());

  static CompletedPostCubit get(context) => BlocProvider.of(context);


  late CompletedPost completedPost ;

 getPercentOfCompleted()  async {

      try{


        emit(GetPostCompletedLoadingState());
        final response = await DioHelper.getData(
            url: Urls.postComplete
        );
        completedPost= CompletedPost.fromJson(response.data);
        emit(GetPostCompletedSuccessState(completedPost: completedPost));
      }catch(error){
        print(error.toString());
        emit(GetPostCompletedErrorState(error.toString()));
      }

 }



}

