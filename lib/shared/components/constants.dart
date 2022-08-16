import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../models/donation_cites/position_cites.dart';
import '../network/local/cachehelper.dart';

// ignore: constant_identifier_names
enum ToastState { SUCCESS, ERROR, WARING }

Color toastColor(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.SUCCESS:
      color = Colors.green;
      break;

    case ToastState.WARING:
      color = Colors.yellow;
      break;

    case ToastState.ERROR:
      color = Colors.red;
      break;
  }
  return color;
}

String token = CacheHelper.getData(key: 'token');

// ===*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=====

// this function for create custom marker from image PNG [ Muhammad AlRifai]
Future<Uint8List?> getBytesFromAsset(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
      targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
      ?.buffer
      .asUint8List();
}



List<LocationOfCites> Cites = [
LocationOfCites(name: "alepo", position: const LatLng(36.167210, 37.123150)),
LocationOfCites(name: "Damascus", position: const LatLng(33.510414, 36.278336)),
LocationOfCites(name: "homs", position: const LatLng(34.726467, 36.43035)),
LocationOfCites(name: "Tartous", position: const LatLng(34.889920,35.891156)),
LocationOfCites(name: "Idlib", position: const LatLng(35.914973, 36.635736)),
LocationOfCites(name: "reaf_Dimashk", position:  const LatLng(33.302608, 36.184249)),
LocationOfCites(name: "Al_hasakah", position: const LatLng(36.495800, 40.747983)),
LocationOfCites(name: "Latakia", position: const LatLng(35.519239, 35.841251)),
LocationOfCites(name: "der_Alzoor", position: const LatLng(35.328359, 40.107404)),
LocationOfCites(name: "Alraka", position: const LatLng(35.939410, 39.015702)),
LocationOfCites(name: "Suwayda", position: const LatLng(32.692899, 36.572219)),
LocationOfCites(name: "Dara", position: const LatLng(32.642116, 36.095266)),
LocationOfCites(name: "Kenitra ", position: const LatLng(33.075214, 35.908917)),
LocationOfCites(name: "Hama", position: const LatLng(35.113570, 36.772212)),
];
