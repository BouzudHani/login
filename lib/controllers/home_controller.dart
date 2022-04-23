
import 'package:get/get.dart';
import 'package:logintest/utils/constant.dart';
import 'package:logintest/utils/storage_management.dart';
import 'package:logintest/views/singn_in_view.dart';

class HomeController extends GetxController{

   var email ;

  @override
  void onInit() {
    email = LocalStorage.readFromStorage(EMAIL_KEY);
    super.onInit();
  }

  logOut(){
    LocalStorage.removeToken(TOKEN_KEY);
    Get.off(SignIn());
  }


}