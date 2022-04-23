// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:logintest/models/users.dart';
import 'package:logintest/utils/constant.dart';
import 'package:logintest/utils/storage_management.dart';
import 'package:logintest/views/home_view.dart';
import 'package:logintest/views/singn_in_view.dart';

class AuthController extends GetxController {
  var emailX = '';
  final _googleSignIn = GoogleSignIn();
  var googleAccount =Rx<GoogleSignInAccount?>(null);
   var rememberValue = false.obs;
   var isLoading = false.obs ;
   var isSignIn = false.obs;
   TextEditingController email = TextEditingController();
   TextEditingController password = TextEditingController();
   TextEditingController firstName = TextEditingController();
   TextEditingController secondName = TextEditingController();
   static const Map<String, String> _JSON_HEADERS = {
     "content-type": "application/json"
   };

   @override
   void onInit() {
    print("test ================================");
     super.onInit();
   }
   void updateLoading(){
     isLoading(!isLoading.value);
   }

  signInWithGoogle()async{
     try{
        googleAccount.value = await _googleSignIn.signIn();
        emailX = googleAccount.value!.email;
        isSignIn.value = true ;
        LocalStorage.writeOnStorage(EMAIL_KEY, emailX);
        LocalStorage.writeOnStorage(TOKEN_KEY, "kljshdf2.226z2fz.zdofpjfzrf456");
        Get.off(const HomeView());
     } catch(e) {
       print(e);
     }
  }
  signOutGoogle()async {
     try {
       await  _googleSignIn.signOut();
       isSignIn.value = false ;
       LocalStorage.removeToken(TOKEN_KEY);
       LocalStorage.removeToken(EMAIL_KEY);
       Get.off(SignIn());
     }
     catch(e) {
        print(e);
     }

  }

  changeRememberStatus () {
    if(rememberValue.isTrue ){
      rememberValue(false) ;
    } else {
      rememberValue(true) ;
    }
  }

  Future<List<User>?> _signIn(String email) async {
     final response = await http.get(Uri.parse("$url/api/v1/signup/?$email"));
     if(response.statusCode==200){
       print(response.body);
       print("truuuuuuuuuuuuuuuuuuuuuuue");
       return userFromJson(response.body);
     }else {
       print(response.reasonPhrase);
       print("faslsssssssssssssssssssssssssssssssssssssssssssse");
       return null ;
     }
  }
   Future<User?> _signUp(String email , String firstName , String secondName , String password) async {
     String body = singleUserToJson(User(password : password ,email: email , firstName: firstName, secondName: secondName , token: "DOHIUG516.OZHU515ZZD51.DZUY55"));
     print(body);
     final response = await http.post(Uri.parse("$url/api/v1/signup/"),body: body, headers: _JSON_HEADERS);
     if(response.statusCode==201){
       print(response.body);
       print("truuuuuuuuuuuuuuuuuuuuuuue");
       return singleUserFromJson(response.body);
     }else {
       print(response.reasonPhrase);
       print(response.headers);
       print(response.statusCode);
       print("faslsssssssssssssssssssssssssssssssssssssssssssse");
       return null ;
     }
   }
  User? handSignUp() {
    updateLoading();
    print(password.text);
    _signUp(email.text, firstName.text, secondName.text, password.text).then((
        value) {
      updateLoading();
      if (value == null) {
        print(value.toString());
        toastMe("Account does not created ", Colors.red);
        return null;
      } else {
        print(value.toString());
        LocalStorage.writeOnStorage(EMAIL_KEY, value.email!);
        LocalStorage.writeOnStorage(TOKEN_KEY, value.token!);
        toastMe("Account created successfully ", Colors.green);
        Get.off(const HomeView());
        return value;
      }
    });
  }

   List<User>? handSignIn(){
     updateLoading();
     _signIn(email.text).then((value) {
       updateLoading();
       if(value != null ){
         if(value.isEmpty){
           print(value.toString());
           toastMe("User not found", Colors.red);
         }else {
           print(value[0]);
           if(value[0].password == password.text){
             LocalStorage.writeOnStorage(EMAIL_KEY, value[0].email!);
             LocalStorage.writeOnStorage(TOKEN_KEY, value[0].token!);
             toastMe("Login successfully ", Colors.green);
             Get.off(const HomeView());
             return value;
           }else{
             toastMe("Password incorrect ", Colors.red);
             return null;
           }
         }
       }else{
         toastMe("check your connection", Colors.red);
         return null;

       }
     });
   }

}