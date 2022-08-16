
import '../../models/gender_donate/gender_donate_model.dart';


abstract class GenderRatioDonorsStates {}

class AppInitial extends GenderRatioDonorsStates {}

class GetGenderRatioDonorsLoadingState extends GenderRatioDonorsStates{}

class GetGenderRatioDonorsSuccessState extends GenderRatioDonorsStates{
  // ignore: non_constant_identifier_names
  final  GenderDonateModel genderDonateModel;

  GetGenderRatioDonorsSuccessState({required this.genderDonateModel});
}

class GetGenderRatioDonorsErrorState extends GenderRatioDonorsStates{
  final  error;

  GetGenderRatioDonorsErrorState(this.error);
}

