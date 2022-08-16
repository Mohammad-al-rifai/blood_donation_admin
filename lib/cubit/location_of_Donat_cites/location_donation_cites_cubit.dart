
import 'dart:collection';
import 'dart:convert';
import 'dart:typed_data';

import 'package:blood_admin/shared/components/constants.dart';
import 'package:blood_admin/shared/network/remote/dio_helper.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../models/age_donate/age_donate_model.dart';
import '../../models/donation_cites/location_donation_cites_model.dart';
import '../../models/gender_donate/gender_donate_model.dart';
import '../../models/location_Post/location_post_model.dart';
import '../../shared/components/components.dart';
import '../../shared/network/end_point.dart';
import 'location_donation_cites_states.dart';


class LocationOfDonationCitesCubit extends Cubit<LocationOfDonationCitesStates>{
  LocationOfDonationCitesCubit() : super(AppInitial());

  static LocationOfDonationCitesCubit get(context) => BlocProvider.of(context);

  var myMarker = HashSet<Marker>(); // Collection
  late LocationDonationCites locationDonationCites;

  late GoogleMapController controller;
  void onMapCreated(GoogleMapController googleMapController) {
    controller = googleMapController;
  }




  getLocationsOfDonationCites() async {
    try{

      emit(GetOfDonationCitesLoadingState());
      final response = await DioHelper.getData(
          url: Urls.getDonationCites
      );
      locationDonationCites=LocationDonationCites.fromJson(response.data);
      print(locationDonationCites);
      myMarker= createMarkers(locationDonationCites,true);
      emit(GetOfDonationCitesSuccessState(myMarker: myMarker));



    }catch(error){
      print(error.toString());
      emit(GetLocationOfDonationCitesErrorState(error));
    }
  }



}
