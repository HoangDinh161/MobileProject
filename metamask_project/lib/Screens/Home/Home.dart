import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:metamask_project/Screens/Buy/Purchase.dart';
import 'package:metamask_project/Screens/Home/SideMenu.dart';
import 'package:provider/provider.dart';

import '../../ImportTokenPage.dart';
import '../../Models/user.dart';
import '../../Services/Database.dart';
import '../Send/SendPage.dart';
import 'WalletList.dart';

/*void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '123',),
    );
  }
}
 */

class MyHomePage extends StatefulWidget {

  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<user>(
      stream: DatabaseService().userData,
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          user? userData = snapshot.data;
          return Scaffold(
              drawer: const SideMenu(),
              appBar: AppBar(
                // The title text which will be shown on the action bar
                toolbarHeight: 47,
                //leading: IconButton(icon: const Icon(Icons.menu, color: Color(0xff1890ff),), onPressed: () {},),
                title: Column(
                    children:const [
                      Text("Wallet", textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,)
                      ),
                      Text("Smart chain", textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff998b8b),
                            fontSize: 9,)
                      ),
                    ]
                ),
                centerTitle: true,
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue,
              ),
              body:  Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.greenAccent[400],
                      radius: 27,
                      child: const Text(
                        'U',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                     SizedBox(
                      width: 76,
                      height: 23,
                      child: Text(
                        userData!.username,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0x89000000),
                          fontSize: 13,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 4.0),
                      child: SizedBox(
                        width: 42,
                        height: 10,
                        child: Text(
                          "\$ 0.36",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff998c8c),
                            fontSize: 9,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: SizedBox(
                        width: 98,
                        height: 16,
                        child: (
                            SizedBox(
                              width: 98,
                              height: 16,
                              child: Material(
                                color: const Color(0xffc9def2),
                                borderRadius: BorderRadius.circular(16),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 15, right: 14, top: 3, bottom: 3, ),
                                  child: (
                                      SizedBox(
                                        width: 68.48,
                                        height: 14,
                                        child: Text(
                                          userData.short(),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 9,

                                          ),
                                        ),
                                      )
                                  ),
                                ),
                              ),
                            )
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 19.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ButtonInMenu(buttonText: 'receive', onTap: () {  }, icon: const Icon(Icons.arrow_downward, color:Colors.white),),
                          ButtonInMenu(buttonText: 'buy', onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const PurchasePage())); },
                            icon: const Icon(Icons.credit_card, color:Colors.white),),
                          ButtonInMenu(buttonText: 'send', onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>const SendPage())); },
                            icon: const Icon(Icons.arrow_upward, color:Colors.white),),
                          ButtonInMenu(buttonText: 'swap', onTap: () {  }, icon: const Icon(Icons.arrow_forward, color:Colors.white),),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: SizedBox(
                        width: 414,
                        height: 20,
                        child: Column(
                            children:const [
                              SizedBox(
                                child: Text(
                                  "Tokens",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xff1890ff),
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              SizedBox(height: 3),
                              Divider(
                                thickness: 1,
                                height: 2,
                                color: Color(0xff1890ff),
                              )
                            ]
                        ),
                      ),
                    ),
                    WalletList(),

                  ],
                ),
              )
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
class ButtonInMenu extends StatelessWidget {
  const ButtonInMenu({ required this.buttonText, required this.icon, required this.onTap, Key? key}) : super(key: key);

  final VoidCallback onTap;
  final Icon icon;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: InkWell(
          onTap: onTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              SizedBox(
                  width: 35,
                  height: 35,
                  child: Material(
                    color: const Color(0xff1890ff),
                    shape: const CircleBorder(),
                    child: icon,
                  )),
              SizedBox(
                  width: 35,
                  child: Text(
                    buttonText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xff1890ff),
                      fontSize: 9,
                    ),
                  )),
            ],
          )),
    );
  }
}

class coinStream extends StatefulWidget {
  const coinStream({Key? key}) : super(key: key);

  @override
  State<coinStream> createState() => _coinStreamState();
}

class _coinStreamState extends State<coinStream> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser.uid)
          .collection('Coins')
          .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return Text('Error = ${snapshot.error}');
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // List<Wallet> WalletFromSnapshot(QuerySnapshot snapshot) {
          //   return snapshot.docs.map((doc) {
          //     Map<String, dynamic> data = doc.data();
          //     return Wallet(
          //         doc.data['coinName'] ?? '',
          //         doc.data['amount'] ?? 0,
          //     );;
          //   }).toList();
          // }
          return ListView();
        }
        );
  }
}