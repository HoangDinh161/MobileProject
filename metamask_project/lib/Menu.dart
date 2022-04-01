import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // The title text which will be shown on the action bar
          toolbarHeight: 47,
          leading: IconButton(icon: const Icon(Icons.menu, color: Color(0xff1890ff),), onPressed: () {},),
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
              const SizedBox(
                width: 76,
                height: 23,
                child: Text(
                  "Account 1",
                  textAlign: TextAlign.center,
                  style: TextStyle(
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
                          child: const Padding(
                            padding: EdgeInsets.only(left: 15, right: 14, top: 3, bottom: 3, ),
                            child: (
                                SizedBox(
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
                    buttonInMenu(buttonText: 'receive', onTap: () {  }, icon: const Icon(Icons.arrow_downward, color:Colors.white),),
                    buttonInMenu(buttonText: 'buy', onTap: () {  }, icon: const Icon(Icons.credit_card, color:Colors.white),),
                    buttonInMenu(buttonText: 'send', onTap: () {  }, icon: const Icon(Icons.arrow_upward, color:Colors.white),),
                    buttonInMenu(buttonText: 'swap', onTap: () {  }, icon: const Icon(Icons.arrow_forward, color:Colors.white),),
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
              Padding(
                padding: const EdgeInsets.only(top: 19.0),
                child: SizedBox(
                  width: 110,
                  height: 39,
                  child: Column(
                    children: const [
                      Text(
                        "Don’t see your token ?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff979797),
                          fontSize: 11,
                        ),
                      ),
                      Text(
                        "Import Tokens",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff1890ff),
                          fontSize: 11,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }

}
class buttonInMenu extends StatelessWidget {
  buttonInMenu({ required this.buttonText, required this.icon, required this.onTap, Key? key}) : super(key: key);

  VoidCallback onTap;
  Icon icon;
  String buttonText;

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