import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:metamask_project/Models/wallet.dart';

import '../../Services/Database.dart';
import 'SendConfirm.dart';

class SendPage extends StatefulWidget {
  const SendPage({Key? key}) : super(key: key);

  @override
  _SendState createState() => _SendState();
}

class _SendState extends State<SendPage> {
  final TextEditingController _receiverController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamBuilder<List<wallet>>(
        stream: DatabaseService().walletList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<wallet>? wallets = snapshot.data;
            wallet dropdownValue = wallets![0];
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Send to',
                  style: TextStyle(
                      fontSize: 16, fontFamily: 'Roboto', color: Colors.black),
                ),
                backgroundColor: Colors.white,
                centerTitle: true,
                actions: [
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
                  child: Column(
                    children: [
                      Row(
                        children: [
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
                                  )))
                        ],
                      ),
                      Row(
                        children: [
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
                              child: TextFormField(
                                  controller: _receiverController,
                                  enabled: true,
                                  decoration: const InputDecoration(
                                    label: Text(
                                      "Receiver ID",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Color.fromRGBO(153, 140, 140, 1),
                                        fontFamily: 'Roboto',
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(4.0)),
                                      borderSide: BorderSide(width: 1.0),
                                    ),
                                  )))
                        ],
                      ),
                      const Divider(thickness: 1,),
                      Row(
                        children: [
                          const Expanded(flex: 1, child: SizedBox()),
                          Expanded(
                            flex: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey
                                )
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<wallet>(
                                  value: dropdownValue,
                                  onChanged: (wallet? newValue) {
                                    setState(() {
                                      dropdownValue = newValue!;
                                    });
                                  },
                                  items: wallets.map<DropdownMenuItem<wallet>>((wallet value) {
                                    return DropdownMenuItem<wallet>(
                                      value: value,
                                      child: Row(
                                        children: [
                                          Image.network(
                                            value.coin.image,
                                            width: 20,
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                value.coin.symbol.toUpperCase(),
                                                textAlign: TextAlign.left,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Roboto',
                                                  fontSize: 14,
                                                  letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                              Text(
                                                'Balance: ${value.amount} ${value.coin.symbol.toUpperCase()}',
                                                textAlign: TextAlign.left,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Roboto',
                                                  fontSize: 14,
                                                  letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ],
                                          )

                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    onPrimary: Colors.blue,
                                    side: const BorderSide(width: 2, color: Colors.blue),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30))),
                                child: const Text(
                                  'Max', textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 10, fontFamily: "Roboto", color: Colors.blue),
                                ),
                                onPressed: () {

                                  }
                              )
                          ),
                          Expanded(
                              flex: 5,
                              child: TextFormField(
                                  controller: _amountController,
                                  enabled: true,
                                  decoration: const InputDecoration(
                                    label: Text(
                                      "Amount",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Color.fromRGBO(153, 140, 140, 1),
                                        fontFamily: 'Roboto',
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(4.0)),
                                      borderSide: BorderSide(width: 1.0),
                                    ),
                                  )
                              )
                          )
                        ],
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
                              fontSize: 12, fontFamily: "Roboto", color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SendConfirm(amount: double.parse(_amountController.text), receiver: _receiverController.text, coin: dropdownValue.coin,)));
                          }
                      ),
                    ],
                  )
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          }

        }
        );
  }
}
