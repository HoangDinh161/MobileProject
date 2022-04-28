
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:metamask_project/Models/Coin.dart';
import 'package:metamask_project/Models/wallet.dart';

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
  List<wallet> _walletListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      //print(doc.data);
      return wallet(
          coin: Coin(doc.data()['id'], doc.data()['name'], doc.data()['symbol'], doc.data()['image']),
          amount: doc.data()['amount'],
      );
    }).toList();
  }

  Stream<user> get userData {
    return FirebaseFirestore.instance.collection('user').doc(uid).snapshots().map(_userDataFromSnapshot);
  }
  Stream<List<wallet>> get walletList  {
    return FirebaseFirestore.instance.collection('user').doc(uid).collection('wallet').snapshots().map(_walletListFromSnapshot);
  }

  Future<bool> buyCoin(Coin coin, String value) async {
    try {
      var amount = double.parse(value);
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection('user')
          .doc(uid)
          .collection('wallet')
          .doc(coin.id);
      FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot snapshot = await transaction.get(documentReference);
        if (!snapshot.exists) {
          documentReference.set({'id': coin.id, 'name': coin.name,'symbol': coin.symbol, 'image': coin.image, 'amount': amount});
          return true;
        }else {
          double newAmount = snapshot.data()['amount'] + amount;
          transaction.update(documentReference, {'amount': newAmount});
        }
        return true;
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}


