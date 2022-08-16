
import '../../models/gender_donate/gender_donate_model.dart';


abstract class GenderRatioDonateStates {}

class AppInitial extends GenderRatioDonateStates {}

class GetGenderRatioDonateLoadingState extends GenderRatioDonateStates{}

class GetGenderRatioDonateSuccessState extends GenderRatioDonateStates{
  // ignore: non_constant_identifier_names
  final  GenderDonateModel genderDonateModel;

  GetGenderRatioDonateSuccessState({required this.genderDonateModel});
}

class GetGenderRatioDonateErrorState extends GenderRatioDonateStates{
  final  error;

  GetGenderRatioDonateErrorState(this.error);
}

