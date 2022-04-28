
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:metamask_project/Models/Coin.dart';

import '../Models/user.dart';

class DatabaseService {

  final String uid = FirebaseAuth.instance.currentUser.uid;

  // collection reference
  // final CollectionReference brewCollection = Firestore.instance.collection('brews');
  user _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return
      user(
        username: snapshot.data()['username'],
        uid: snapshot.data()['uid'],
    );
  }
  // brew list from snapshot
  Stream<user> get userData {
    print(uid);
    return FirebaseFirestore.instance.collection('user').doc(uid).snapshots().map(_userDataFromSnapshot);
  }

}
