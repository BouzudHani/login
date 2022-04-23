import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInController extends ChangeNotifier {
  final _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;

  login()async{
    googleSignInAccount = await _googleSignIn.signIn() ;
    notifyListeners();
  }
  logOut()async{
    googleSignInAccount = await _googleSignIn.signOut()  ;
    notifyListeners();
  }
}