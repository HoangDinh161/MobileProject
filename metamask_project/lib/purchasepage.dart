import 'package:flutter/material.dart';
/*
void main() {
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
      home: PurchasePage(),
    );
  }
}
 */

class PurchasePage extends StatelessWidget {
  const PurchasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text('Purchase Method', style: TextStyle(fontSize: 16,fontFamily: "Roboto",color: Colors.black),),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions:[
          TextButton(child: const Text('Cancel',style: TextStyle(fontSize: 12,fontFamily: "Roboto",color: Colors.blueAccent),),
          onPressed: (){},)
        ],
        ),
      body: Container(
        margin: const EdgeInsets.all(15),
        height: 150,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border:Border.all(
            color: Colors.lightBlue,
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
              const Text('Bank transfer or debit card', textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14,fontFamily: "Roboto",fontWeight: FontWeight.bold),),
              const SizedBox(height: 10,),
              const Text('Requires registration',textAlign: TextAlign.left,
              style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold,color: Colors.black26),),
              const SizedBox(height: 5,),
              const Text('Credit/debit card or bank transfer depending on location',textAlign: TextAlign.left,
              style: TextStyle(fontSize: 11,fontFamily: 'Roboto',color: Colors.black26),),
              const SizedBox(height: 15,),
              ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  minimumSize: const Size(350,30),
                  side: const BorderSide(width: 2,color: Colors.blue),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                  )
              ),
              child: const Text('Buy BNB',style: TextStyle(fontSize: 12,fontFamily: "Roboto", color: Colors.white),),
              onPressed: () { },
            ),
          ],
        ),
      ),
    );
  }
}

class BuyPage extends StatefulWidget {
  const BuyPage({Key? key}) : super(key: key);

  @override
  _BuyState createState() => _BuyState();
}

class _BuyState extends State<BuyPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

    );
  }

}