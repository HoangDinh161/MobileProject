import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';
import 'createWallet.dart';
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
      home: const StartPage(),
    );
  }
}

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var screensize = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 22,),
                  const Text(
                    'METAMASK',style: TextStyle(fontSize: 16, fontFamily:"Roboto Mono", letterSpacing: 5,fontWeight: FontWeight.normal ),
                  ),
                  const SizedBox(height: 20,),
                  const Text('Wallet Setup', style: TextStyle(fontSize: 18,fontFamily: "Roboto", fontWeight: FontWeight.bold),),
                  const SizedBox(height: 15),
                  const Text('Import an existing wallet or create new one', style: TextStyle(fontSize: 12, fontFamily: "Roboto", fontWeight: FontWeight.normal),),
                  SizedBox(height: screensize.height*0.58),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(width: 2, color: Colors.blue),
                      minimumSize: const Size(250,40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        )
                    ),
                    child: const Text('Import using Secret Recovery Phrase',style: TextStyle(fontSize: 12,fontFamily: "Roboto", color: Colors.blue),) ,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const ImportPage()));
                    },
                  ),
                  const SizedBox(height: 5,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        onPrimary: Colors.white,
                        minimumSize: const Size(250,40),
                        side: const BorderSide(width: 2,color: Colors.blue),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                        )
                      ),
                      child: const Text('Create a new wallet',style: TextStyle(fontSize: 12,fontFamily: "Roboto", color: Colors.white),),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const CreateWalletPage()));
                      },
                  ),
                  const SizedBox(height: 30),
                  const Text('By proceeding, you agree to these Terms and Conditions',style: TextStyle(fontSize: 11, fontFamily: "Roboto",color: Colors.black26) )
                ],
          )
        )
        )
    );
  }
}

class ImportPage extends StatefulWidget {
  const ImportPage({Key? key}) : super(key: key);

  @override
  _ImportState createState() => _ImportState();
}

class _ImportState extends State<ImportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 18,),
                          Row (
                            mainAxisAlignment: MainAxisAlignment.start,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children:[
                              Expanded(
                                  flex: 1,
                                  child: IconButton(
                                      alignment: Alignment.centerLeft,
                                      onPressed: () {Navigator.pop(context);},
                                      icon: const Icon(Icons.arrow_back,size: 16, )
                                  )),
                              const Expanded(
                                  flex: 3,
                                  child: Text('METAMASK',textAlign:TextAlign.center,style: TextStyle(fontSize: 16, fontFamily:"Roboto Mono", letterSpacing: 5,fontWeight: FontWeight.normal,))
                              ),
                              const Expanded(
                                  flex: 1,
                                  child: Text(''),
                              )
                            ]),
                          const Text("Import from seed",textAlign: TextAlign.center, style: TextStyle(fontSize:16, fontFamily: "Roboto", fontWeight: FontWeight.bold),),
                          const SizedBox(height: 15,),
                          Container(
                                padding: const EdgeInsets.fromLTRB(15,0,15,0),
                                child:Column(
                                    children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: const <Widget>[
                                              Text('Secret Recovery Phrase',style: TextStyle(fontFamily: "Roboto", fontSize: 12),),
                                              Text('' )
                                            ],
                                          ),
                                          PasswordField(
                                            color: Colors.blue,
                                            floatingText: "Secret Phrases",
                                            inputDecoration: PasswordDecoration(),
                                            border: PasswordBorder(
                                                border: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Colors.blueAccent,
                                                  ),
                                                  borderRadius: BorderRadius.circular(10),
                                                )
                                            ),
                                          ),
                                          const SizedBox(height: 15,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: const <Widget>[
                                              Text('New Password',style: TextStyle(fontFamily: "Roboto", fontSize: 12),),
                                              Text('' )
                                            ],
                                          ),
                                          PasswordField(
                                              color: Colors.blue,
                                              inputDecoration: PasswordDecoration(),
                                              border: PasswordBorder(
                                                border: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Colors.blueAccent,
                                                  ),
                                                  borderRadius: BorderRadius.circular(10),
                                                )
                                              ),
                                        ),
                                          const SizedBox(height: 15,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: const <Widget>[
                                              Text('Confirm Password',style: TextStyle(fontFamily: "Roboto", fontSize: 12),),
                                              Text('' )
                                            ],
                                          ),
                                          PasswordField(
                                            color: Colors.blue,
                                            inputDecoration: PasswordDecoration(),
                                            border: PasswordBorder(
                                                border: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Colors.blueAccent,
                                                  ),
                                                  borderRadius: BorderRadius.circular(10),
                                                )
                                            ),
                                          ),
                                          const SizedBox(height: 20,),
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
                                        )
                                      ])
                                   ),
                          const SizedBox(height: 15,),
            ]
          )
        )

    );
  }

}
