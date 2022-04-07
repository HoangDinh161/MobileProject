import 'package:flutter/material.dart';

class ImportTokenPage extends StatefulWidget {
  const ImportTokenPage({Key? key}) : super(key: key);

  @override
  _ImportTokenState createState() => _ImportTokenState();
}

class _ImportTokenState extends State<ImportTokenPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 47,
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Color(0xff1890ff),),
          onPressed: () {Navigator.pop(context);},
        ),
        title: Column(
            children:const [
              Text("Import Token", textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,fontFamily: "Roboto",)
              ),
              Text("Smart chain", textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff998b8b),
                    fontSize: 9,fontFamily: "Roboto",)
              ),
            ]
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
                const Text('CUSTOM TOKEN', style: TextStyle(fontSize: 16, fontFamily: 'Roboto',color: Colors.lightBlue ),),
                const Divider(
                  thickness: 1,
                  height: 2,
                  color: Color(0xff1890ff),
                ),
                Container(
                  color: const Color.fromARGB(253, 253, 218, 1),
                  decoration:  BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(243, 240, 199, 1),
                      ),
                      borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const <Widget>[
                      Icon(Icons.warning_amber_rounded,color: Color.fromARGB(243, 240, 199, 1),),
                      Text("Anyone can create a token, including creating fake versions of existing tokens.Learn more about scams and security risks.",
                        overflow: TextOverflow.clip, style: TextStyle(fontSize: 9, fontFamily: "Roboto",color: Colors.black),
                      )
                    ],
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text('Token Address',style: TextStyle(fontFamily: "Roboto", fontSize: 12),),
                  Text('' )
                ],
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Enter Token Address',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text('Token Symbol',style: TextStyle(fontFamily: "Roboto", fontSize: 12),),
                  Text('' )
                ],
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Enter Token Symbol',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text('Token of Precision',style: TextStyle(fontFamily: "Roboto", fontSize: 12),),
                  Text('' )
                ],
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Enter Token of Precision',
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    minimumSize: const Size(350,35),
                    side: const BorderSide(width: 2,color: Colors.blue),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                    )
                ),
                child: const Text('Import',style: TextStyle(fontSize: 12,fontFamily: "Roboto", color: Colors.white),),
                onPressed: () { },
              ),
            ],
          ),
        ),

      ),
    );
  }

}