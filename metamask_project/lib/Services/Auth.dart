import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// import '../Models/User.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User> get authStateChanges => _auth.idTokenChanges();

  Future<bool> import(String phrases, String password) async {
    try{
      await _auth.signInWithEmailAndPassword(email: phrases, password: password);
      return true;
    } catch(e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> newWallet(String phrases, String password, String username,) async {
    try{
      String mail = phrases.replaceAll(' ', '') + "@mail.com";
      await _auth.createUserWithEmailAndPassword(email: mail, password: password).then((value) async{
        User user = FirebaseAuth.instance.currentUser;
        await FirebaseFirestore.instance.collection("users").doc(user.uid).set({
          'uid': user.uid,
          'phrase': phrases,
          'username': 'Account',
        });
      });
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


