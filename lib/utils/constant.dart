

// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const url = 'https://6262ab71c430dc560d259fbe.mockapi.io';
const EMAIL_KEY = "email";
const TOKEN_KEY = "token";
const WELCOME = "Welcome";
void toastMe(String cons , Color color){
  Fluttertoast.showToast(
      msg: cons,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0
  );
}