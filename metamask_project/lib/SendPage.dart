import 'package:flutter/material.dart';

class SendPage extends StatefulWidget {
  const SendPage({Key? key}) : super(key: key);

  @override
  _SendState createState() => _SendState();
}

class _SendState extends State<SendPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: const Text('Send to', style: TextStyle(fontSize: 16,fontFamily: "Roboto",color: Colors.black),),
          backgroundColor: Colors.white,
          centerTitle: true,
          actions:[
            TextButton(child: const Text('Cancel',style: TextStyle(fontSize: 12,fontFamily: "Roboto",color: Colors.blueAccent),),
              onPressed: (){Navigator.pop(context);},)
          ],
        ) ,
        body: SingleChildScrollView(
              child: Column(

              )
        ),
    );
  }
  
}