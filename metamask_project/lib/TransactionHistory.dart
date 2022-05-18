// ignore_for_file: always_specify_types

import 'package:flutter/material.dart';
import 'package:metamask_project/Models/Transaction.dart';
import 'package:metamask_project/Screens/Home/Home.dart';
import 'package:metamask_project/Services/Database.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Trans>>(
      stream: DatabaseService().transList,
      builder: (BuildContext context, AsyncSnapshot<List<Trans>> snapshot) {
        if (snapshot.hasData) {
          List<Trans>? trans = snapshot.data;
          return Scaffold(
              appBar: AppBar(
                // The title text which will be shown on the action bar
                toolbarHeight: 47,
                leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder:
                          (BuildContext context) => const MyHomePage()));
                    }),

                title: Column(children: const [
                  Text(
                    'Transaction',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        color: Colors.black),
                  ),
                  Text(
                    'Smart chain',
                    style: TextStyle(
                        fontSize: 9, fontFamily: 'Roboto', color: Colors.grey),
                  )
                ]),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.greenAccent[400],
                      radius: 17,
                      child: const Text(
                        'U',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ),
                ],
                centerTitle: true,
                backgroundColor: Colors.white,
              ),
              body: ListView.builder(
                itemCount: trans?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                        child: TransTile(
                          trans: trans![index],
                          index: index,
                        )),
                  );
                },
              ));
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

class TransTile extends StatelessWidget {
  TransTile({required this.trans, required this.index, Key? key})
      : super(key: key);

  Trans trans;
  num index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showSimpleDialog(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '#$index - ${trans.date} at ${trans.time} this device',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromRGBO(153, 140, 140, 1),
                fontFamily: 'Roboto',
                fontSize: 9,
              ),
            ),
          ),
          Row(
            children: [
              const Expanded(
                flex: 1,
                child: Icon(
                  Icons.arrow_circle_up,
                  color: Colors.blue,
                  size: 24,
                ),
              ),
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${trans.type} ${trans.name}',
                      style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'Roboto',
                          color: Colors.black),
                    ),
                    Text(
                      trans.status,
                      style: const TextStyle(
                          fontSize: 9,
                          fontFamily: 'Roboto',
                          color: Colors.green),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  '${trans.amount}${trans.name}',
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                      fontSize: 12, fontFamily: 'Roboto', color: Colors.black),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Divider(
              height: 2,
              color: Colors.grey,
              thickness: 1,
            ),
          )
        ],
      ),
    );
  }

  void showSimpleDialog(BuildContext context) => showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(28),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(18)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '${trans.type} ${trans.name}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Roboto',
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close),
                        color: Colors.black,
                        iconSize: 14,
                      ))
                ],
              ),
              const Divider(
                thickness: 1,
                height: 2,
                indent: 0,
                endIndent: 0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(top: 13.0, bottom: 5),
                                    child: Text('Status',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(143, 146, 145, 1),
                                          fontFamily: 'Roboto',
                                          fontSize: 7,
                                        )),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 13.0),
                                    child: Text(trans.status,
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                          color: Colors.green,
                                          fontFamily: 'Roboto',
                                          fontSize: 11,
                                        )),
                                  )
                                ]),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(top: 13.0, bottom: 5),
                                    child: Text('Date',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(143, 146, 145, 1),
                                          fontFamily: 'Roboto',
                                          fontSize: 7,
                                        )),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 13.0),
                                    child:
                                        Text('${trans.date} at ${trans.time}',
                                            textAlign: TextAlign.right,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Roboto',
                                              fontSize: 11,
                                            )),
                                  )
                                ]),
                          ],
                        ), //first line
                        const Divider(
                          thickness: 1,
                          height: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(top: 13.0, bottom: 5),
                                    child: Text('From',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(143, 146, 145, 1),
                                          fontFamily: 'Roboto',
                                          fontSize: 7,
                                        )),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 13.0),
                                    child: Text(trans.shortFrom(),
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Roboto',
                                          fontSize: 11,
                                        )),
                                  )
                                ]),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(top: 13.0, bottom: 5),
                                    child: Text('To',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(143, 146, 145, 1),
                                          fontFamily: 'Roboto',
                                          fontSize: 7,
                                        )),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 13.0),
                                    child: Text(trans.shortTo(),
                                        textAlign: TextAlign.right,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Roboto',
                                          fontSize: 11,
                                        )),
                                  )
                                ]),
                          ],
                        ), //second line
                        const Divider(
                          thickness: 1,
                          height: 2,
                          indent: 0,
                          endIndent: 0,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 13.0, bottom: 5),
                                child: Text('NONCE',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color.fromRGBO(143, 146, 145, 1),
                                      fontFamily: 'Roboto',
                                      fontSize: 7,
                                    )),
                              ),
                              Text('#$index',
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Roboto',
                                    fontSize: 11,
                                  ))
                            ]), //third line
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 22.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0x72998b8b), width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 12.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Amount',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Roboto',
                                              fontSize: 9,
                                            )),
                                        Text('${trans.amount} ${trans.name}',
                                            textAlign: TextAlign.right,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Roboto',
                                              fontSize: 9,
                                            )),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 12.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Estimated gas fee',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Roboto',
                                              fontSize: 9,
                                            )),
                                        Text('${trans.fee} ${trans.name}',
                                            textAlign: TextAlign.right,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Roboto',
                                              fontSize: 9,
                                            )),
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    thickness: 1,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 27.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Total amount',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Roboto',
                                                fontSize: 9,
                                                fontWeight: FontWeight.bold)),
                                        Text('${trans.Tamount} ${trans.name}',
                                            textAlign: TextAlign.right,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Roboto',
                                                fontSize: 9,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ) //theBox
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      });
}
