import 'dart:async';

import 'package:blood_admin/cubit/location_of_post/location_of_post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import '../cubit/location_of_Donat_cites/location_donation_cites_cubit.dart';
import '../cubit/location_of_Donat_cites/location_donation_cites_states.dart';
import '../cubit/location_of_Donors_cites/location_donors_cites_cubit.dart';
import '../cubit/location_of_Donors_cites/location_donors_cites_states.dart';
import '../cubit/location_of_post/location_of_post_states.dart';

// ignore: must_be_immutable
class LocationOfDonorsCitesScreen extends StatelessWidget {
  LocationOfDonorsCitesScreen({Key? key}) : super(key: key);


  final LatLng initialCameraPosition =
  const LatLng(33.51177742614248, 36.262189082469476);

  TextEditingController sourceController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  TextEditingController testController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationOfDonorsCitesCubit, LocationOfDonorsCitesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('نسبة توزع المتبرعين'),
          ),
          body: Column(
            children: [
               Expanded(
               child: (state is GetOfDonorsCitesSuccessState)?
                    GoogleMap(
                     mapType: MapType.normal,
                     initialCameraPosition: CameraPosition(
                       target:initialCameraPosition,
                       zoom: 15.0,
                     ),

                     onMapCreated: LocationOfPostsCubit.get(context).onMapCreated,
                     myLocationEnabled: true,
                     markers: state.myMarker,
                   ):const Center(child:CircularProgressIndicator()),
                 ),


            ],

          ),
        );
      },
    );
  }
}
