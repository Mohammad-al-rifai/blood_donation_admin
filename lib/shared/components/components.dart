import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


import '../../models/donation_cites/location_donation_cites_model.dart';
import 'constants.dart';

Widget buildItem(business, context) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage('${business['urlToImage']}'),
                fit: BoxFit.cover,
              )),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          // ignore: sized_box_for_whitespace
          child: Container(
            height: 120.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text(
                    "${business['title']}",
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  child: Text(
                    "${business['publishedAt']}",
                    style: const TextStyle(color: Colors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(start: 20),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey,
      ),
    );

void navigatorTo(context, Widget screen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}

void navigatorToNew(context, Widget screen) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => screen), (route) => false);
}

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  Icon? prefix,
  required Function valid,
  bool correct = true,
  bool focus = true,
  bool isPassword = false,
  bool enable = true,
  Icon? suffix,
  Function? onChanged,
  Function? onSubmitted,
  Function? suffixPressed,
  //Function ?onTap,
}) =>
    TextFormField(
      enabled: enable,
      validator: (s) {
        valid();
        return null;
      },
      // onTap: (){
      //   onTap!();
      // },
      controller: controller,
      keyboardType: type,
      autocorrect: true,
      autofocus: true,
      textAlign: TextAlign.start,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        labelStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
        prefixIcon: prefix,
        suffixIcon: suffix != null
            ? IconButton(
                icon: suffix,
                onPressed: () {
                  suffixPressed!();
                },
              )
            : null,
      ),
      onChanged: (s) {
        onChanged!();
      },
      onFieldSubmitted: (s) {
        onSubmitted!();
      },
    );

Widget defaultTextButton(
    {required String text,
    required Function function,
    Color color = Colors.white}) {
  return TextButton(
      onPressed: () {
        function();
      },
      child: Text(
        text.toUpperCase(),
        style: GoogleFonts.tajawal(
            textStyle: TextStyle(color: color, fontSize: 50.sp)),
      ));
}

void showToast({required String msg, required ToastState state}) =>
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: toastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

// ignore: must_be_immutable

HashSet<Marker> createMarkers(LocationDonationCites LocationDonationCites,bool type){
  var myMarker = HashSet<Marker>(); // Collection

  //Alepo
  myMarker.add(
    Marker(
      markerId: MarkerId(LocationDonationCites.Aleppo.toString()),
      position:  Cites[0].position,
      infoWindow:  InfoWindow( //popup info
        title: 'نسبة${type?'المتبرع لهم' :'المتبرعين' } في محافظة حلب',
        snippet: '${(LocationDonationCites.Aleppo/LocationDonationCites.AleppoPeople)*100}',
      ),
    ),
  );

  //Damascus
  myMarker.add(
    Marker(
      markerId: MarkerId(LocationDonationCites.Aleppo.toString()),
      position:  Cites[1].position,
      infoWindow:  InfoWindow( //popup info
        title: 'نسبة ${type?'المتبرع لهم' :'المتبرعين' } في محافظة دمشق',
        snippet: '${(LocationDonationCites.Aleppo/LocationDonationCites.AleppoPeople)*100}',
      ),
    ),
  );
  //homes
  myMarker.add(
    Marker(
      markerId: MarkerId(LocationDonationCites.Aleppo.toString()),
      position:  Cites[2].position,
      infoWindow:  InfoWindow( //popup info
        title: 'نسبة ${type?'المتبرع لهم' :'المتبرعين' } في محافظة حمص',
        snippet: '${(LocationDonationCites.Homs/LocationDonationCites.HamaPeople)*100}',
      ),
    ),
  );
  //Tartous
  myMarker.add(
    Marker(
      markerId: MarkerId(LocationDonationCites.Aleppo.toString()),
      position:  Cites[3].position,
      infoWindow:  InfoWindow( //popup info
        title: 'نسبة ${type?'المتبرع لهم' :'المتبرعين' } في محافظة طرطوس',
        snippet: '${(LocationDonationCites.Tartous/LocationDonationCites.TartousPeople)*100}',
      ),
    ),
  );
  myMarker.add(
    Marker(
      markerId: MarkerId(LocationDonationCites.Aleppo.toString()),
      position:  Cites[4].position,
      infoWindow:  InfoWindow( //popup info
        title: 'نسبة ${type?'المتبرع لهم' :'المتبرعين' } في محافظة إدلب',
        snippet: '${(LocationDonationCites.Idlib/LocationDonationCites.IdlibPeople)*100}',
      ),
    ),
  );

  myMarker.add(
    Marker(
      markerId: MarkerId(LocationDonationCites.Aleppo.toString()),
      position:  Cites[5].position,
      infoWindow:  InfoWindow( //popup info
        title: 'نسبة ${type?'المتبرع لهم' :'المتبرعين' } في محافظة ريف دمشق',
        snippet: '${(LocationDonationCites.reafDimashk/LocationDonationCites.reafDimashkPeople)*100}',
      ),
    ),
  );

  myMarker.add(
    Marker(
      markerId: MarkerId(LocationDonationCites.Aleppo.toString()),
      position:  Cites[6].position,
      infoWindow:  InfoWindow( //popup info
        title: 'نسبة ${type?'المتبرع لهم' :'المتبرعين' } في محافظة الحسكة',
        snippet: '${(LocationDonationCites.AlHasakah/LocationDonationCites.AlHasakahPeople)*100}',
      ),
    ),
  );
  myMarker.add(
    Marker(
      markerId: MarkerId(LocationDonationCites.Aleppo.toString()),
      position:  Cites[7].position,
      infoWindow:  InfoWindow( //popup info
        title: 'نسبة ${type?'المتبرع لهم' :'المتبرعين' } في محافظة اللاذقية',
        snippet: '${(LocationDonationCites.Latakia/LocationDonationCites.LatakiaPeople)*100}',
      ),
    ),

  );
  myMarker.add(
    Marker(
      markerId: MarkerId(LocationDonationCites.Aleppo.toString()),
      position:  Cites[8].position,
      infoWindow:  InfoWindow( //popup info
        title: 'نسبة ${type?'المتبرع لهم' :'المتبرعين' } في محافظة دير الزور',
        snippet: '${(LocationDonationCites.derAlzoor/LocationDonationCites.derAlzoorPeople)*100}',
      ),
    ),
  );
  myMarker.add(
    Marker(
      markerId: MarkerId(LocationDonationCites.Aleppo.toString()),
      position:  Cites[9].position,
      infoWindow:  InfoWindow( //popup info
        title: 'نسبة ${type?'المتبرع لهم' :'المتبرعين' } في محافظة الرقة',
        snippet: '${(LocationDonationCites.Alraka/LocationDonationCites.AlrakaPeople)*100}',
      ),
    ),
  );
  myMarker.add(
    Marker(
      markerId: MarkerId(LocationDonationCites.Aleppo.toString()),
      position:  Cites[10].position,
      infoWindow:  InfoWindow( //popup info
        title: 'نسبة ${type?'المتبرع لهم' :'المتبرعين' } في محافظة السويداء',
        snippet: '${(LocationDonationCites.Suwayda/LocationDonationCites.SuwaydaPeople)*100}',
      ),
    ),
  );
  myMarker.add(
    Marker(
      markerId: MarkerId(LocationDonationCites.Aleppo.toString()),
      position:  Cites[11].position,
      infoWindow:  InfoWindow( //popup info
        title: 'نسبة ${type?'المتبرع لهم' :'المتبرعين' } في محافظة درعا',
        snippet: '${(LocationDonationCites.Dara/LocationDonationCites.DaraPeople)*100}',
      ),
    ),
  );
  myMarker.add(
    Marker(
      markerId: MarkerId(LocationDonationCites.Aleppo.toString()),
      position:  Cites[12].position,
      infoWindow:  InfoWindow( //popup info
        title: 'نسبة ${type?'المتبرع لهم' :'المتبرعين' } في محافظة القنيطرة',
        snippet: '${(LocationDonationCites.Kenitra/LocationDonationCites.KenitraPeople)*100}',
      ),
    ),
  );
  myMarker.add(
    Marker(
      markerId: MarkerId(LocationDonationCites.Aleppo.toString()),
      position:  Cites[13].position,
      infoWindow:  InfoWindow( //popup info
        title: 'نسبة ${type?'المتبرع لهم' :'المتبرعين' } في محافظة حماه',
        snippet: '${(LocationDonationCites.Hama/LocationDonationCites.HamaPeople)*100}',
      ),
    ),
  );
  return myMarker;
}
