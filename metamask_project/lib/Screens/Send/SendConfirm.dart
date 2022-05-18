

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:metamask_project/Screens/Home/Home.dart';

import '../../Models/Coin.dart';
import '../../Services/Database.dart';
import '../../TransactionHistory.dart';

class SendConfirm extends StatelessWidget {
  SendConfirm({required this.amount, required this.receiver,
    required this.coin,Key? key}) : super(key: key);
  double amount;
  String receiver;
  Coin coin;
  @override
  Widget build(BuildContext context) {
    double gasfee = amount*0.1;
    double tmount = amount - gasfee;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Send to',
          style: TextStyle(
              fontSize: 16, fontFamily: 'Roboto', color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Cancel',
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Roboto',
                  color: Colors.blueAccent),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 5),
            child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      Row(
                        children: <Widget>[
                          const Expanded(
                              flex: 1,
                              child: Text(
                                  'From:',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Roboto',
                                    fontSize: 11,
                                    fontWeight: FontWeight.normal,
                                  ),
                      )),
                        Expanded(
                            flex: 5,
                          child: Padding(
                              padding: const EdgeInsets.only(top: 10, left: 5),
                              child: TextFormField(
                                enabled: false,
                                decoration: InputDecoration(
                                  label: Text(
                                    FirebaseAuth.instance.currentUser.uid,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      color: Color.fromRGBO(153, 140, 140, 1),
                                      fontFamily: 'Roboto',
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(4.0)),
                                    borderSide: BorderSide(width: 1.0),
                                  ),
                                ))))
                        ],
                      ),
                    Row(
                      children: <Widget>[
                        const Expanded(
                            flex: 1,
                            child: Text(
                              'To:',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Roboto',
                                fontSize: 11,
                                fontWeight: FontWeight.normal,
                              ),
                            )),
                      Expanded(
                        flex: 5,
                        child: Padding(
                            padding: const EdgeInsets.only(top: 10, left: 5),
                            child: TextFormField(
                            enabled: false,
                            decoration:InputDecoration(
                              label: Text(
                                receiver,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  color: Color.fromRGBO(153, 140, 140, 1),
                                  fontFamily: 'Roboto',
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              border: const OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                                borderSide: BorderSide(width: 1.0),
                              ),
                            )))
                    ),
                  ],
                ),
                    const Divider(
                    thickness: 1,
                  ),
                    const Text(
                    'AMOUNT', textAlign: TextAlign.center, style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Roboto',
                      fontSize: 13,
                      letterSpacing: 0 /*percentages not used in flutter.
                      defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1.5384615384615385
                    ),
                  ),
                    Padding(
                        padding: const EdgeInsets.only(top: 20 ),
                        child: Text(
                    amount.toString(), textAlign: TextAlign.center,
                          style: const TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Roboto',
                      fontSize: 36,
                      letterSpacing: 0 /*percentages not used in flutter.
                       defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 0.5555555555555556
                    ),
                  )),
                    Container(
                        margin: const EdgeInsets.only(top: 15, bottom: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: const BorderRadius.all(
                            Radius.circular(18)),
                    ),
                      child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Text('Estimated gas fee',
                                textAlign: TextAlign.center, style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Roboto',
                                  fontSize: 12,
                                  letterSpacing: 0 /*percentages not
                                  used in flutter.defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1.6666666666666667
                                ),
                              ),
                              Text( gasfee.toString() + ' '+ coin.symbol,
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  color: Color.fromRGBO(24, 144, 255, 1),
                                  fontFamily: 'Roboto',
                                  fontSize: 12,
                                  letterSpacing: 0 /*percentages not used
                                  in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1.6666666666666667
                              ),)
                            ],
                        ),
                        const Divider(thickness: 1, color: Colors.black,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Text('Total', textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Roboto',
                                fontSize: 12,
                                letterSpacing: 0 /*percentages not used
                                 in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1.6666666666666667
                            ),
                            ),
                            Text( tmount.toString() + ' '+ coin.symbol,
                              textAlign: TextAlign.right, style:
                              const TextStyle(fontFamily: 'Roboto',
                                fontSize: 12,
                                letterSpacing: 0 /*percentages not
                                used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1.6666666666666667,
                                color: Color.fromRGBO(24, 144, 255, 1),
                            ),)
                          ],
                        ),

                      ],
                    ),
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
                        'Next',
                        style: TextStyle(
                            fontSize: 12, fontFamily: 'Roboto',
                            color: Colors.white),
                      ),
                      onPressed:  () async{
                        if (await DatabaseService().sendCoin(coin, receiver,
                          amount.toString(),)) {
                          Future.delayed(const Duration(milliseconds: 500), () {
                            Navigator.push(context, MaterialPageRoute(builder:
                                (BuildContext context) => const TransactionHistory()
                              )
                            );
                          });
                        }
                      }
                  ),
                ]
                  )
        )
      )
    );
  }

}