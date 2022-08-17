import 'package:blood_admin/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../dashbordes/screen_age_donate.dart';
import '../dashbordes/screen_age_donors.dart';
import '../dashbordes/screen_blood_group.dart';
import '../dashbordes/screen_gender_donate.dart';
import '../dashbordes/screen_gender_donors.dart';
import '../dashbordes/screen_location_of_donation_cites.dart';
import '../dashbordes/screen_location_of_donors_cites.dart';
import '../dashbordes/screen_location_of_post.dart';
import '../dashbordes/screen_post_complet.dart';
import '../dashbordes/send_notification.dart';

class Home extends StatelessWidget{
   Home({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('لوحة الاحصائيات'),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            childAspectRatio: 1,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          padding: const EdgeInsets.all(10),
          itemCount: screens.length,
          itemBuilder: (context, index){
            return buildItem(index: index,context: context); }
          ),
    );
  }
}


List<Widget> screens=[
  const PostCompleteScreen(),
  const BloodGroupRatioScreen(),
  const GenderDonateScreen(),
  const GenderDonorsScreen(),
  const AgeDonateScreen(),
  const AgeDonorsScreen(),
  LocationOfPostScreen(),
  LocationOfDonationCitesScreen(),
  LocationOfDonorsCitesScreen(),
];
List<String> titleScreens=
[
  'طلبات التبرع',
  'زمر الدم',
  'جنس المتبرع لهم',
  'جنس المتبرعين',
  'أعمار المتبرع لهم',
  'أعمار المتبرعين',
  'التوزع الجغرافي للطلبات',
  'التوزع الجغرافي للمتلقين',
  'التوزع الجغرافي للمتبرعين',

];

List<String> imageScreens=
[

  'assets/images/blood.png',
  'assets/images/blood-drop.png',
  'assets/images/sex.png',
  'assets/images/sex2.png',
  'assets/images/age.png',
  'assets/images/age2.png',
  'assets/images/architecture-and-city.png',
  'assets/images/placeholder.png',
  'assets/images/placeholder.png',



];




Widget buildItem({required int index,context}){
  return InkWell(
    onTap: (){
      navigatorTo(context, screens[index]);
      print("***************");
      print(index);
      },
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              blurRadius: 3,
              offset: Offset(0, 2),
            ),
          ]),
      padding: const EdgeInsets.all(16),
      child: GridTile(
        footer: Center(child: Text(titleScreens[index],style:
        TextStyle(fontWeight: FontWeight.bold,fontSize: 40.0.sp),)),
        child: Center(child:buildImage(urlImage: imageScreens[index])),
      ),
    ),
  );
}


Widget buildImage({required String urlImage}) {
  return  Material(
    color: Colors.transparent,
    child: Image(
      image:  AssetImage(urlImage),
      width: 250.w,
      height: 270.h,
    ),
  );
}
