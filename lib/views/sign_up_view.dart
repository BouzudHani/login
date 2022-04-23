import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logintest/controllers/auth_controller.dart';
import 'package:logintest/utils/loading.dart';

class SignUp extends GetView {
   SignUp({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  var rememberValue = false;
  @override
  Widget build(BuildContext context) {
    final AuthController c = Get.put(AuthController());
    return Scaffold(
      backgroundColor: Colors.cyan[700],
      body: Obx(()=> Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 60,),
                    const Text(
                      'Sign up',
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
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: c.firstName,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your first name';
                                    }
                                    return null;
                                  },
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    hintText: 'First name',
                                    hintStyle: const TextStyle(color: Colors.white),
                                    prefixIcon: const Icon(Icons.person, color: Colors.white,),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: c.secondName,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your Last name';
                                    }
                                    return null;
                                  },
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    hintText: 'Last name',
                                    hintStyle: const TextStyle(color: Colors.white),
                                    prefixIcon: const Icon(Icons.person ,color: Colors.white,),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: c.email,
                            validator: (value) => EmailValidator.validate(value!)
                                ? null
                                : "Please enter a valid email",
                            maxLines: 1,
                            decoration: InputDecoration(
                              hintText: 'Enter your email',
                              hintStyle: const TextStyle(color: Colors.white),
                              prefixIcon: const Icon(Icons.email , color: Colors.white,),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: c.password,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                            maxLines: 1,
                            obscureText: true,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock , color: Colors.white,),
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
                                c.handSignUp();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                              primary: Colors.black,
                            ),
                            child: const Text(
                              'Sign up',
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
                              const Text('Already registered?' , style: TextStyle(color: Colors.white),),
                              TextButton(
                                onPressed: () => Get.back(),
                                child: const Text('Sign in' , style: TextStyle(color: Colors.black),),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          c.isLoading.value ? Loading() : Container()
        ],
      )),
    );
  }
}
