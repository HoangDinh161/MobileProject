import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  SideMenu({Key? key }) : super(key : key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
            DrawerHeader(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                            Image.asset("assets/mini_logo.png"),
                            const Text('METAMASK',style:TextStyle(fontSize: 10, fontFamily: "Roboto Mono", letterSpacing:5, fontWeight: FontWeight.normal  ) ,)
                        ],
                      ),
                      SizedBox(height: 5,),
                      CircleAvatar(
                        child: Text('U',),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(242, 244, 243, 1),
                  ) ,
                )
            ),
            ListTile(),
        ],
      ),
    );
  }

}