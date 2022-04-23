
// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:logintest/controllers/start_controller.dart';
import 'package:logintest/views/home_view.dart';
import 'package:logintest/views/sign_up_view.dart';
import 'package:logintest/views/singn_in_view.dart';
import 'package:logintest/views/start_page.dart';

part 'app_routes.dart';
class AppPages{
  static const INIT = Routes.START ;

  static final routes = [
    GetPage(name: Routes.SIGNIN, page: ()=> SignIn()),
    GetPage(name: Routes.SIGNUP, page: ()=> SignUp()),
    GetPage(name: Routes.HOME, page: ()=> const HomeView()),
    GetPage(name: Routes.START, page: ()=>const  Start()),
  ];
}