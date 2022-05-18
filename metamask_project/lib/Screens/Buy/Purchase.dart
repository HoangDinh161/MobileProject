// ignore_for_file: always_specify_types, lines_longer_than_80_chars

import 'package:flutter/material.dart';

import 'Buy.dart';

class PurchasePage extends StatelessWidget {
  const PurchasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Purchase Method',
          style: TextStyle(
              fontSize: 16, fontFamily: 'Roboto', color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        toolbarHeight: 47,
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Cancel',
              style: TextStyle(
                  fontSize: 12, fontFamily: 'Roboto', color: Colors.blueAccent),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        height: 150,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.lightBlue,
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Bank transfer or debit card',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Requires registration',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.black26),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Credit/debit card or bank transfer depending on location',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 11, fontFamily: 'Roboto', color: Colors.black26),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  minimumSize: const Size(350, 30),
                  side: const BorderSide(width: 2, color: Colors.blue),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              child: const Text(
                'Buy',
                style: TextStyle(
                    fontSize: 12, fontFamily: 'Roboto', color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) => const BuyPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
