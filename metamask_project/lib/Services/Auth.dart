import 'package:firebase_auth/firebase_auth.dart';

import '../Models/User.dart';

Future<bool> import(String phrases, String password) async {
  try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: phrases, password: password);
    return true;
  } catch(e) {
    print(e.toString());
    return false;
  }
}

Future<bool> newWallet(String phrases, String password) async {
  try{
    String mail = phrases.replaceAll(' ', '') + "@mail.com";
    print(mail);
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: mail, password: password);
    return true;
  }
  catch(e) {
    print(e.toString());
    return false;
  }
}
