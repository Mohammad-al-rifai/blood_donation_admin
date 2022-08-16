
import 'dart:collection';
import 'dart:convert';
import 'dart:typed_data';

import 'package:blood_admin/shared/network/remote/dio_helper.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../models/age_donate/age_donate_model.dart';
import '../../models/gender_donate/gender_donate_model.dart';
import '../../models/location_Post/location_post_model.dart';
import '../../shared/network/end_point.dart';
import 'location_of_post_states.dart';


class LocationOfPostsCubit extends Cubit<LocationOfPostsStates>{
  LocationOfPostsCubit() : super(AppInitial());

  static LocationOfPostsCubit get(context) => BlocProvider.of(context);

  var myMarker = HashSet<Marker>(); // Collection
  late LocationPostModel locationPostModel;

  late GoogleMapController controller;
  void onMapCreated(GoogleMapController googleMapController) {
    controller = googleMapController;
  }




  getLocationsOfPost() async {
    try{

      emit(GetLocationOfPostLoadingState());
      final response = await DioHelper.getData(
          url: Urls.getAllLocations
      );
      locationPostModel=LocationPostModel.fromJson(response.data);
      locationPostModel.data.forEach((element) {

        myMarker.add(
            Marker(
              markerId: MarkerId(element.positionId.toString()),
              position:  LatLng(element.positionLat,element.positionLang),

            ),
        );

      }


    );
      emit(GetLocationOfPostSuccessState(myMarker: myMarker));



    }catch(error){
      emit(GetLocationOfPostErrorState(error));
    }
  }

}
