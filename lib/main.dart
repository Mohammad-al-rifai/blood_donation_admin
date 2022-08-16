import 'dart:io';
import 'package:blood_admin/cubit/age_ratio_donate/age_ratio_donate_cubit.dart';
import 'package:blood_admin/cubit/completed_post/completed_post_states.dart';
import 'package:blood_admin/layout/home.dart';
import 'package:blood_admin/shared/components/components.dart';
import 'package:blood_admin/shared/components/constants.dart';
import 'package:blood_admin/shared/network/local/cachehelper.dart';
import 'package:blood_admin/shared/network/remote/dio_helper.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cubit/blood_group_ratio/blood_group_cubit.dart';
import 'cubit/completed_post/completed_post_cubit.dart';
import 'cubit/gender_ratio_donate/gender_ratio_donate_cubit.dart';
import 'cubit/gender_ratio_donors/gender_ratio_donors_cubit.dart';
import 'cubit/get_all_tokens/get_all_tokens_cubit.dart';
import 'cubit/location_of_post/location_of_post_cubit.dart';
import 'dashbordes/screen_location_of_post.dart';
import 'shared/bloc_observer.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("on background massage");
  print(message.data.toString());
  showToast(msg: "on background massage", state: ToastState.SUCCESS);
}

main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();



  //START  Notifications

  await Firebase.initializeApp();
  var token = await FirebaseMessaging.instance.getToken();
  print("*************************");
  print(token);

  print("*************************");
  FirebaseMessaging.onMessage.listen((event) {

    print("on onMessage");
    print(event.data.toString());
    showToast(msg: "on massage", state: ToastState.SUCCESS);
  });
  FirebaseMessaging.onMessageOpenedApp.listen((event) {

    print("on onMessage Opened App");
    print(event.data.toString());
    showToast(msg: "on onMessage Opened App", state: ToastState.SUCCESS);

  });

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  //END  Notifications



  await CacheHelper.init();

  DioHelper.init();
  runApp(const MyApp());
}


 class MyHttpOverrides extends HttpOverrides {
   @override
   HttpClient createHttpClient(SecurityContext? context) {
     return super.createHttpClient(context)
       ..badCertificateCallback =
           (X509Certificate cert, String host, int port) => true;
   }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1080, 2280),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return
           MaterialApp(
            debugShowCheckedModeBanner: false,
            //Use this line to prevent extra rebuilds
            useInheritedMediaQuery: true,
            //You can use the library anywhere in the app even in theme
            theme: ThemeData(
              iconTheme: const IconThemeData(
                color: Colors.black,
                opacity: 1,
              ),
              primarySwatch: Colors.red,
              textTheme: TextTheme(bodyText2: TextStyle(fontSize: 30.sp)),
            ),
            home:Home(),
          );






      },
    );
  }
}
