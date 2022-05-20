
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:metamask_project/Models/wallet.dart';

import '../../Models/Coin.dart';
import '../../Services/Database.dart';
import 'SendConfirm.dart';

class ReceiverFieldValidator {
  static String? validate(String? value, String uid) {
    if (value == null|| value.isEmpty) {
      return 'Please enter receiver id';
    }
    if (value.length < 28) {
      return 'Id must be 28 characters long';
    }
    if (value == uid) {
      return 'You cannot send to yourself';
    }
    return null;
  }
}

class AmountFieldValidator {
  static String? validate(String? value, double amount) {
    if (value == null|| value.isEmpty) {
      return 'Please enter amount of token';
    }
    if (double.parse(value) > amount ) {
      return 'Amount you enter is larger than amount of your wallet';
    }
    return null;
  }
}


class SendPage extends StatefulWidget {
  SendPage({required this.wallets,Key? key}) : super(key: key);
  List<wallet>? wallets;

  @override
  _SendState createState() => _SendState();
}

class _SendState extends State<SendPage> {
  final TextEditingController _receiverController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  wallet dropdownValue = wallet(coin: Coin('','','',''), amount: 0, value:0);

  @override
  initState() {
    dropdownValue = widget.wallets![0];
  }


  @override
  Widget build(BuildContext context) {
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
              child:Column(
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
                  Form (
                      key: _formKey1,
                      child:Row(
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
                                padding: const EdgeInsets
                                    .only(top: 10, left: 5),
                                child: TextFormField(
                                    controller: _receiverController,
                                    keyboardType: TextInputType.text,
                                    enabled: true,
                                    decoration: const InputDecoration(
                                      label: Text(
                                        'Receiver ID',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Color.fromRGBO(153, 140,
                                              140, 1),
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
                                    ),
                                  validator: (String? value)
                                  => ReceiverFieldValidator.validate(value,
                                      FirebaseAuth.instance.currentUser.uid),
                                )
                            )),
                    ],
                  )),
                  const Divider(thickness: 1,),
                  Row(
                    children: <Widget>[
                      const Expanded(flex: 1, child: SizedBox()),
                      Expanded(
                        flex: 5,
                        child: Container(
                          margin: const EdgeInsets.only(left: 5),
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
                              items: widget.wallets?.
                              map<DropdownMenuItem<wallet>>((wallet value) {
                                return DropdownMenuItem<wallet>(
                                  value: value,
                                  child: Row(
                                    children: <Widget>[
                                      Image.network(
                                        value.coin.image,
                                        width: 20,
                                      ),
                                      Padding(
                                          padding: const EdgeInsets
                                              .only(top:5, left: 5),
                                          // ignore: lines_longer_than_80_chars
                                          child:Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                value.coin.symbol.toUpperCase(),
                                                textAlign: TextAlign.left,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Roboto',
                                                  fontSize: 14,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                              // ignore: lines_longer_than_80_chars
                                              Text(
                                                'Balance: ${value.amount}'
                                                    ' ${value.coin.symbol.
                                                toUpperCase()}',
                                                textAlign: TextAlign.left,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'Roboto',
                                                  fontSize: 14,
                                                  letterSpacing:
                                                  0 ,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ],
                                          ))

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
                  Form(
                      key:_formKey,
                      child:Row(
                        children: <Widget>[
                          Expanded(
                              flex: 1,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      onPrimary: Colors.blue,
                                      side: const BorderSide(width: 2,
                                          color: Colors.blue),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.
                                          circular(30))),
                                  child: const Text(
                                    'Max', textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 10, fontFamily: 'Roboto',
                                        color: Colors.blue),
                                  ),
                                  onPressed: () {
                                    _amountController.text = dropdownValue
                                        .amount
                                        .toString();
                                  }
                              )
                          ),
                          Expanded(
                              flex: 5,
                              child: Padding(
                                  padding: const EdgeInsets.only(top: 10,
                                      left: 5),
                                  child:TextFormField(
                                    controller: _amountController,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp(
                                              r'^[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)$'
                                          )),
                                    ],
                                    enabled: true,
                                    decoration: const InputDecoration(
                                      label: Text(
                                        'Amount',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Color.fromRGBO(153, 140,
                                              140, 1),
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
                                    ),
                                    validator:(String? value) =>
                                        AmountFieldValidator.validate(value,
                                            dropdownValue.amount),
                                  )
                              ))
                        ],
                      )),
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
                      onPressed: () async {
                        if (_formKey1.currentState!.validate() &
                        _formKey.currentState!.validate()) {
                          if (await lookingForUser(_receiverController.text)) {
                              Navigator.push(
                              context,
                              // ignore: always_specify_types
                              MaterialPageRoute(builder:
                                  (BuildContext context) => SendConfirm(amount:
                                  double.parse(_amountController.text),
                                    receiver: _receiverController.text,
                                    coin: dropdownValue.coin,)));
                              } else {
                              const SnackBar snackBar =  SnackBar(
                                  content: Text('This receiver account is not exist. Please check that address again and re-enter it!',
                                    style: TextStyle(fontSize: 12,
                                        fontFamily: 'Roboto', color: Colors.red)
                                  ));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                          }
                        }
                  ),
                ],
              )
          )
      ),
    );
  }
}
