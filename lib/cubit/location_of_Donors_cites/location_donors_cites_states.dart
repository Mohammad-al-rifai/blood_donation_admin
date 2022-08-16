
import 'dart:collection';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../models/age_donate/age_donate_model.dart';
import '../../models/gender_donate/gender_donate_model.dart';
import '../../models/location_Post/location_post_model.dart';


abstract class LocationOfDonorsCitesStates {}

class AppInitial extends LocationOfDonorsCitesStates {}

class GetOfDonorsCitesLoadingState extends LocationOfDonorsCitesStates{}

class GetOfDonorsCitesSuccessState extends LocationOfDonorsCitesStates{
  // ignore: non_constant_identifier_names
  final  myMarker ; // C

  GetOfDonorsCitesSuccessState({required this.myMarker});
}

class GetLocationOfDonorsCitesErrorState extends LocationOfDonorsCitesStates{
  final  error;
  GetLocationOfDonorsCitesErrorState(this.error);
}

