
import '../../models/age_donate/age_donate_model.dart';
import '../../models/gender_donate/gender_donate_model.dart';


abstract class AgeRatioDonateStates {}

class AppInitial extends AgeRatioDonateStates {}

class GetAgeRatioDonateLoadingState extends AgeRatioDonateStates{}

class GetAgeRatioDonateSuccessState extends AgeRatioDonateStates{
  // ignore: non_constant_identifier_names
  final  AgeDonateModel ageDonateModel;

  GetAgeRatioDonateSuccessState({required this.ageDonateModel});
}

class GetAgeRatioDonateErrorState extends AgeRatioDonateStates{
  final  error;

  GetAgeRatioDonateErrorState(this.error);
}

