
import '../../models/age_donate/age_donate_model.dart';
import '../../models/gender_donate/gender_donate_model.dart';


abstract class AgeRatioDonorsStates {}

class AppInitial extends AgeRatioDonorsStates {}

class GetAgeRatioDonorsLoadingState extends AgeRatioDonorsStates{}

class GetAgeRatioDonorsSuccessState extends AgeRatioDonorsStates{
  // ignore: non_constant_identifier_names
  final  AgeDonateModel ageDonateModel;

  GetAgeRatioDonorsSuccessState({required this.ageDonateModel});
}

class GetAgeRatioDonorsErrorState extends AgeRatioDonorsStates{
  final  error;

  GetAgeRatioDonorsErrorState(this.error);
}

