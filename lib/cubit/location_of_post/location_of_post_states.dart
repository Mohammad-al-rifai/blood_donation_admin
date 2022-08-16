
import 'dart:collection';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../models/age_donate/age_donate_model.dart';
import '../../models/gender_donate/gender_donate_model.dart';
import '../../models/location_Post/location_post_model.dart';


abstract class LocationOfPostsStates {}

class AppInitial extends LocationOfPostsStates {}

class GetLocationOfPostLoadingState extends LocationOfPostsStates{}

class GetLocationOfPostSuccessState extends LocationOfPostsStates{
  // ignore: non_constant_identifier_names
  final  myMarker ; // C

  GetLocationOfPostSuccessState({required this.myMarker});
}

class GetLocationOfPostErrorState extends LocationOfPostsStates{
  final  error;
  GetLocationOfPostErrorState(this.error);
}

