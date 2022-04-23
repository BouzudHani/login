import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logintest/controllers/home_controller.dart';
import 'package:logintest/utils/constant.dart';

class HomeView extends GetView {
  const HomeView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final HomeController hm = Get.put(HomeController());
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      body:  Center(
        child: Column(
          children: [
            SizedBox(height: size.height*0.4,),
            const Text(
              WELCOME,
            style: TextStyle(color: Colors.cyan , fontSize: 30 , fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height*0.05,),
            Text(
              hm.email,
              style: const TextStyle(color: Colors.black , fontSize: 20 , fontWeight: FontWeight.bold),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            hm.logOut();
        },
        child: const Icon(Icons.logout),
      ),
    );
  }
}
