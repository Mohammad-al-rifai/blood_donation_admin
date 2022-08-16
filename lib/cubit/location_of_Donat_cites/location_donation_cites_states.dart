
import 'dart:collection';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../models/age_donate/age_donate_model.dart';
import '../../models/gender_donate/gender_donate_model.dart';
import '../../models/location_Post/location_post_model.dart';


abstract class LocationOfDonationCitesStates {}

class AppInitial extends LocationOfDonationCitesStates {}

class GetOfDonationCitesLoadingState extends LocationOfDonationCitesStates{}

class GetOfDonationCitesSuccessState extends LocationOfDonationCitesStates{
  // ignore: non_constant_identifier_names
  final  myMarker ; // C

  GetOfDonationCitesSuccessState({required this.myMarker});
}

class GetLocationOfDonationCitesErrorState extends LocationOfDonationCitesStates{
  final  error;
  GetLocationOfDonationCitesErrorState(this.error);
}

