import 'package:blood_admin/cubit/get_all_tokens/get_all_tokens_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/get_all_tokens/get_all_tokens_states.dart';
import '../cubit/notification/notification_cubit.dart';
import '../cubit/notification/notification_states.dart';
import '../shared/components/components.dart';

class SendNotification extends StatelessWidget{
   SendNotification({Key? key}) : super(key: key);
  TextEditingController notification = TextEditingController();
   NotificationCubit notificationCubit=new NotificationCubit();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
      create:(BuildContext context)=>GetAllTokensCubit()..getAllTokens(),
      child: BlocConsumer<GetAllTokensCubit,GetAllTokensStates>(
        listener: (context,state){},
        builder: (context, state) {
          return  Scaffold(
        appBar:  AppBar(
          title: const Text('Send Notification'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                textDirection: TextDirection.ltr,
                controller: notification,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "هذا الحقل لا يمكن أن يكون فارغا";
                  }
                  },
                decoration: InputDecoration(
                  label: const Text(
                    'الإشعار',
                    style: TextStyle(color: Colors.red),
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: const Icon(
                    Icons.notifications_active,
                    color: Colors.red,
                  ),
                ),
              ),
             /* TextFormField(
                   textDirection: TextDirection.ltr,
                   onChanged: (){},
                   label: 'الإشعار',
                   type: TextInputType.text,
                   valid: (value){
                     if (value!.isEmpty) {
                       return "هذا الحقل لا يمكن أن يكون فارغا";
                     }
                   },
                   controller: notification,
                 ),*/
              SizedBox(height: 30,),

              Container(
                color: Colors.red,
                child: TextButton(onPressed: (){
                  print(state);
                  print(state);
                  if(state is GetAllTokensSuccessState){
                    print("/////////////////////////////////////////////////////");
                    state.tokens.forEach((element) {
                      notificationCubit.sendNotification(
                          tokenPh: element,
                          title: 'Blood Donation',
                          body:notification.text );
                    });
                  }

                }, child:  const Text('إرسال الإشعار',
                  style:
                  TextStyle(
                      color: Colors.white,
                      fontSize: 12.0),
                ),
                ),
              ),



            ],
          ),
        ),
      );
        }),
      );


  }
}
