import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:logintest/controllers/start_controller.dart';
import 'package:logintest/utils/constant.dart';
import 'package:logintest/utils/loading.dart';

class Start  extends GetView{
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StartController sc = Get.put(StartController());
    return Scaffold(
     backgroundColor: Colors.cyan[700],
     body: Container(
       width: double.infinity,
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: const [
            Text(
             WELCOME,
             style: TextStyle(
               color: Colors.white,
               fontSize: 50,
               fontWeight: FontWeight.bold,
             ),
           ),
           Padding(
             padding: EdgeInsets.all(60),
             child: SizedBox(
               height: 30,
               width: 30,
               child: CircularProgressIndicator(
                 backgroundColor: Colors.transparent,
                 valueColor: AlwaysStoppedAnimation(Colors.white),
                 strokeWidth: 4,
               ),
             ),
           ),
         ],
       ),
     ),
        );
  }


}