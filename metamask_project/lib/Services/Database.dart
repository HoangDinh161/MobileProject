
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:metamask_project/Models/Coin.dart';
import 'package:metamask_project/Models/wallet.dart';

import '../Models/user.dart';
import '../Models/Transaction.dart';
import 'package:intl/intl.dart';


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

  List<Trans> _transListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      //print(doc.data);
      return Trans(
        doc.data()['type'],
        doc.data()['name'],
        doc.data()['status'],
        doc.data()['time'],
        doc.data()['date'],
        doc.data()['from'],
        doc.data()['to'],
        doc.data()['Tamount'],
        doc.data()['amount'],
        doc.data()['fee'],
      );
    }).toList();
  }

  Stream<List<Trans>> get transList  {
    return FirebaseFirestore.instance.collection('user').doc(uid).collection('trans').snapshots().map(_transListFromSnapshot);
  }

  Stream<user> get userData {
    return FirebaseFirestore.instance.collection('user').doc(uid).snapshots().map(_userDataFromSnapshot);
  }
  Stream<List<wallet>> get walletList  {
    return FirebaseFirestore.instance.collection('user').doc(uid).collection('wallet').snapshots().map(_walletListFromSnapshot);
  }
  Future<bool> buyCoin(Coin coin, String value) async {
    try {
      bool added = false;
      var amount = double.parse(value);
      var now = DateTime.now();
      var formatterDate = DateFormat.MMMMd('en_US') ;
      var formatterTime = DateFormat.jm();
      var formatterDoc1 = DateFormat.yMMMMd('en_US') ;
      var formatterDoc2 = DateFormat.Hms();
      String actualDate = formatterDate.format(now);
      String actualTime = formatterTime.format(now);
      String docName = formatterDoc1.format(now) + formatterDoc2.format(now);
      docName = docName.replaceAll(' ', '');
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection('user')
          .doc(uid)
          .collection('wallet')
          .doc(coin.id);
      FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot snapshot = await transaction.get(documentReference);
        await FirebaseFirestore.instance.collection("user").doc(uid).collection("trans").doc(docName).set({
          'type': 'Buy',
          'name': coin.symbol.toUpperCase(),
          'status': 'Confirmed',
          'time': actualTime,
          'date': actualDate,
          'from': uid,
          'to': uid,
          'Tamount': amount,
          'amount': amount,
          'fee': 0.0,
        });
        if (snapshot.exists) {
          if (!added) {
            double newAmount = snapshot.data()['amount'] + amount;
            transaction.update(documentReference, {'amount': newAmount});
            return true;
          }
          return true;
        } else {
          documentReference.set({'id': coin.id, 'name': coin.name,'symbol': coin.symbol, 'image': coin.image, 'amount': amount});
          added = true;
          return true;
        }
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> sendCoin(Coin coin,String receiver, String value) async {
    try {
      var amount = double.parse(value);
      var now = DateTime.now();
      var formatterDate = DateFormat.MMMMd('en_US') ;
      var formatterTime = DateFormat.jm();
      var formatterDoc1 = DateFormat.yMMMMd('en_US') ;
      var formatterDoc2 = DateFormat.Hms();
      String actualDate = formatterDate.format(now);
      String actualTime = formatterTime.format(now);
      String docName = formatterDoc1.format(now) + formatterDoc2.format(now);
      docName = docName.replaceAll(' ', '');
      DocumentReference documentReference1 = FirebaseFirestore.instance
          .collection('user')
          .doc(uid)
          .collection('wallet')
          .doc(coin.id);
      DocumentReference documentReference2 = FirebaseFirestore.instance
          .collection('user')
          .doc(receiver)
          .collection('wallet')
          .doc(coin.id);
      FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot snapshot1 = await transaction.get(documentReference1);
        DocumentSnapshot snapshot2 = await transaction.get(documentReference2);
        double newAmount = snapshot1.data()['amount'] - amount;
        transaction.update(documentReference1, {'amount': newAmount});
        if (!snapshot2.exists) {
          documentReference2.set({'id': coin.id, 'name': coin.name,'symbol': coin.symbol, 'image': coin.image, 'amount': amount});
        }else {
          double newAmount = snapshot2.data()['amount'] + amount;
          transaction.update(documentReference2, {'amount': newAmount});
        }
        await FirebaseFirestore.instance.collection("user").doc(uid).collection("trans").doc(docName).set({
          'type': 'Send',
          'name': coin.symbol.toUpperCase(),
          'status': 'Confirmed',
          'time': actualTime,
          'date': actualDate,
          'from': uid,
          'to': receiver,
          'Tamount': amount,
          'amount': amount*0.9,
          'fee': amount*0.1,
        });
        await FirebaseFirestore.instance.collection("user").doc(receiver).collection("trans").doc(docName).set({
          'type': 'Receive',
          'name': coin.symbol.toUpperCase(),
          'status': 'Confirmed',
          'time': actualTime,
          'date': actualDate,
          'from': uid,
          'to': receiver,
          'Tamount': amount,
          'amount': amount*0.9,
          'fee': amount*0.1,
        });
        return true;
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}

Future<bool> lookingForUser(String? receiver) async {
  if (receiver == null) {
    return false;
  }
  DocumentSnapshot document = await FirebaseFirestore.instance.collection('user').doc(receiver).get();
  if(document.exists) {
    return true;
  } else {
    return false;
  }
}


