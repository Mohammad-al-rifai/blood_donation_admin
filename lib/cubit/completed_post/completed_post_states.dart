import 'package:blood_admin/models/completed_post/completed_post_model.dart';

import '../../models/completed_post/completed_post_model.dart';


abstract class CompletedPostStates {}

class AppInitial extends CompletedPostStates {}

class GetPostCompletedLoadingState extends CompletedPostStates{}

class GetPostCompletedSuccessState extends CompletedPostStates{
  // ignore: non_constant_identifier_names
  final  CompletedPost completedPost;

  GetPostCompletedSuccessState({required this.completedPost});
}

class GetPostCompletedErrorState extends CompletedPostStates{
  final  error;

  GetPostCompletedErrorState(this.error);
}

