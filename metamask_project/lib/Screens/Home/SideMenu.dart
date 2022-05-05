import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:metamask_project/Screens/Auth/ReLogin.dart';
import 'package:metamask_project/TransactionHistory.dart';

import '../../Models/user.dart';
import '../../Models/wallet.dart';
import '../Auth/StartPage.dart';
import 'Home.dart';

class SideMenu extends StatelessWidget {
  SideMenu({required this.wallets, required this.userData,Key? key}) : super(key: key);
  user? userData;
  List<wallet>? wallets;
  @override
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
                    Image.asset("assets/mini_logo.png"),
                    const Text(
                      'METAMASK',
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: "Roboto Mono",
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
                const SizedBox(
                  width: 76,
                  height: 23,
                  child: Text(
                    "Account 1",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0x89000000),
                      fontSize: 10,
                    ),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.only(top: 4.0),
                  child: SizedBox(
                    height: 10,
                    child: getTotal(wallets: wallets),
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
                        child: const Padding(
                          padding: EdgeInsets.only(
                            left: 15,
                            right: 14,
                            top: 3,
                            bottom: 3,
                          ),
                          child: (SizedBox(
                            width: 68.48,
                            height: 14,
                            child: Text(
                              "0x5368...4037",
                              textAlign: TextAlign.center,
                              style: TextStyle(
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
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.list_outlined),
            title: const Text('Activity'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TransactionHistory()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: const Text('Log out'),
            onTap: () {
              FirebaseAuth.instance.signOut().then((value) => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StartPage())));
            },
          )
        ],
      ),
    );
  }
}
