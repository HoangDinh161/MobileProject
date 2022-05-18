// ignore_for_file: always_specify_types

import 'package:firebase_auth/firebase_auth.dart';

// import '../Models/User.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User> get authStateChanges => _auth.idTokenChanges();

  Future<bool> import(String phrases, String password) async {
    try{
      String mail = phrases.replaceAll(' ', '') + '@mail.com';
      await _auth.signInWithEmailAndPassword(email: mail, password: password);
      return true;
    } catch(e) {
      //print(e.toString());
      return false;
    }
  }

  Future<bool> newWallet(String phrases, String password, String username,)
  async {
    try{
      String mail = phrases.replaceAll(' ', '') + '@mail.com';
      await _auth.createUserWithEmailAndPassword(email: mail,
          password:password);
      return true;
    }
    catch(e) {
      print(e.toString());
      return false;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}


