
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/network/end_point.dart';
import '../../shared/network/remote/dio_helper.dart';
import 'notification_states.dart';

class NotificationCubit extends Cubit<NotificationStates> {
  NotificationCubit() : super(SendNotificationLoadingState());

  static NotificationCubit get(context) => BlocProvider.of(context);

  //late NotificationModel notificationModel;


  sendNotification({
    required String tokenPh,
    required String title,
    required String body,
  }) {
    emit(SendNotificationLoadingState());

    DioHelper.postData(
        url: Urls.notification,
        token:
            'AAAAkAP22Xw:APA91bGy5GmUkH0eASrnklH61ZFTwkdwkb3v6lJu6hIvZFp9BJLHsATicKyCodaa_7jf2-aLDHzDIU_GvghJ7-V76F4WuXm-Ww1VcMi4srSZlUYuEV3oF4a0y2eKHBA5hwfTl22iygjY',
        key: 'key=',
        data: {
          'to': tokenPh,
          'notification': {'title': title, 'body': body},
        }).then((value) async {
          print("hhhhhhhhhhh");
          print(value);
     // notificationModel = await NotificationModel.fromJson(value.data);

      print('Data Here>>>>>>>>>>>>>>:');
      print(value.data);
      emit(SendNotificationSuccessState());
    }).catchError((error) {
      print("+++++++++++++++++++++++++++HERE");
      print(error.toString());
      emit(SendNotificationErrorState(error.toString()));
    });
  }

  getTokenPh(id) {
    emit(GetTokenPhoneLoadingState());
    DioHelper.getData(
      url: Urls.notification,
      //token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaXNBZG1pbiI6dHJ1ZSwiaWF0IjoxNjU1MTM3NDA0fQ.tM7A-DNAouIYF8R4CDuAusi6OuH5qRMJkAp0VHCqkac'
    ).then((value) {
      print(value.data);
      emit(GetTokenPhoneSuccessState());
    }).catchError((error) {
      print(error.data);
      emit(GetTokenPhoneErrorState(error.toString()));
    });
  }
}
