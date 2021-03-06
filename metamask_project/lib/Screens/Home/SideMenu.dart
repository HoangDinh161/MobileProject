

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:metamask_project/TransactionHistory.dart';

import '../../Models/user.dart';
import '../Auth/StartPage.dart';
import 'Home.dart';

class SideMenu extends StatelessWidget {
  SideMenu({required this.total,
    required this.userData, required this.uid,Key? key}) : super(key: key);
  user? userData;
  double total;
  String uid;

  String short(String str) {
    return str.substring(0, 7) + '...'
        + str.substring(uid.length -5, uid.length);
  }

  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image.asset('assets/mini_logo.png'),
                    const Text(
                      'METAMASK',
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Roboto Mono',
                          letterSpacing: 5,
                          fontWeight: FontWeight.normal),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                CircleAvatar(
                  backgroundColor: Colors.greenAccent[400],
                  radius: 17,
                  child: const Text(
                    'U',
                    style: TextStyle(fontSize: 10, color: Colors.white),
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
                      fontSize: 10,
                    ),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: SizedBox(
                    height: 10,
                    child: Text(
                      '\$ ${total.toStringAsFixed(2)}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
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
                    child: (SizedBox(
                      width: 98,
                      height: 16,
                      child: Material(
                        color: const Color(0xffc9def2),
                        borderRadius: BorderRadius.circular(16),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 14,
                            top: 3,
                            bottom: 3,
                          ),
                          child: (SizedBox(
                            width: 68.48,
                            height: 14,
                            child: Text(
                              short(uid),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 9,
                              ),
                            ),
                          )),
                        ),
                      ),
                    )),
                  ),
                ),
              ],
            ),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(242, 244, 243, 1),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.account_balance_wallet_outlined),
            title: const Text('Wallet'),
            onTap: () {
              Navigator.push(
                  // ignore: always_specify_types
                  context, MaterialPageRoute(
                      builder: (BuildContext context) => const MyHomePage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.list_outlined),
            title: const Text('Activity'),
            onTap: () {
              Navigator.push(
                  context,
                  // ignore: always_specify_types
                  MaterialPageRoute(
                      builder: (BuildContext context)
                      => const TransactionHistory()));
            },
          ),
          /**ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {},
          ),**/
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: const Text('Log out'),
            onTap: () {
              // ignore: always_specify_types
              FirebaseAuth.instance.signOut().then((value) => Navigator.push(
                  context,
                  // ignore: always_specify_types
                  MaterialPageRoute(builder: (BuildContext context)
                  => const StartPage())));
            },
          )
        ],
      ),
    );
  }
}
