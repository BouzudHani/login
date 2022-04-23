import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logintest/controllers/auth_controller.dart';
import 'package:logintest/utils/Loading.dart';
import 'package:logintest/views/sign_up_view.dart';
class SignIn extends GetView {
   SignIn({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final AuthController rc = Get.put(AuthController());
    return Scaffold(
      backgroundColor: Colors.cyan[700],
      body: Obx(()=> Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(left: 40 , right: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 100,),
                    const Text(
                      'Sign in',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: rc.email,
                            validator: (value) => EmailValidator.validate(value!)
                                ? null
                                : "Please enter a valid email",
                            maxLines: 1,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Enter your email',
                              hintStyle: const TextStyle(color: Colors.white),
                              prefixIcon  : const Icon(Icons.email, color: Colors.white,),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: rc.password,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                            style: const TextStyle(color: Colors.white),
                            maxLines: 1,
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock, color: Colors.white,),
                              hintText: 'Enter your password',
                              hintStyle: const TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),

                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                rc.handSignIn();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                              primary: Colors.black,
                            ),
                            child: const Text(
                              'Sign in',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Not registered yet?', style: TextStyle(color: Colors.white),),
                              TextButton(
                                onPressed: () => Get.to(SignUp()),
                                child: const Text('Create an account' , style: TextStyle(color: Colors.black),),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          const Text(
                            "Or" ,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,

                            ),),
                          const SizedBox(height: 20,),
                          ElevatedButton(
                            onPressed: () {
                                rc.signInWithGoogle();
                            },
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                primary: Colors.white,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(8))
                                )
                            ),
                            child: Row(
                              children: const [
                                FaIcon(FontAwesomeIcons.google, color: Colors.red,),
                                SizedBox(width: 40,),
                                Text(
                                  'Login with google account',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),

                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          rc.isLoading.value ? Loading() : Container()
        ],
      )),
    );
  }
}
