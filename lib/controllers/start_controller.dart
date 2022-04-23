import 'dart:async';

import 'package:get/get.dart';
import 'package:logintest/utils/constant.dart';
import 'package:logintest/utils/storage_management.dart';
import 'package:logintest/views/home_view.dart';
import 'package:logintest/views/singn_in_view.dart';

class StartController extends GetxController{

    @override
    void onInit() {
      super.onInit();
      Timer(const Duration(seconds: 3), (){_checkAthentication();});
      print("test ================================");
    }

    void _checkAthentication(){
     final token =  LocalStorage.readFromStorage(TOKEN_KEY);
      if(token == null){
          Get.off(SignIn());
        print("no token ");
      }else {
        Get.off(const HomeView());
        print("token");
      }
    }
}