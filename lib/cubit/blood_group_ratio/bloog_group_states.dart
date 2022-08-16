abstract class BloodGroupStates{}

class GetBloodGroupRatioInitialState extends BloodGroupStates{}

class GetBloodGroupRatioLoadingState extends BloodGroupStates{}

class GetBloodGroupRatioSuccessState extends BloodGroupStates{}

class GetBloodGroupRatioErrorState extends BloodGroupStates{
  final  error;
  GetBloodGroupRatioErrorState(this.error);
}
