import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';
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
      home: StartPage(),
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
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 22,),
                  Text(
                    'METAMASK',style: TextStyle(fontSize: 16, fontFamily:"Roboto Mono", letterSpacing: 5,fontWeight: FontWeight.normal ),
                  ),
                  SizedBox(height: 20,),
                  Text('Wallet Setup', style: TextStyle(fontSize: 18,fontFamily: "Roboto", fontWeight: FontWeight.bold),),
                  SizedBox(height: 15),
                  Text('Import an existing wallet or create new one', style: TextStyle(fontSize: 12, fontFamily: "Roboto", fontWeight: FontWeight.normal),),
                  SizedBox(height: screensize.height*0.58),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 2, color: Colors.blue),
                      minimumSize: Size(250,40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        )
                    ),
                    child: Text('Import using Secret Recovery Phrase',style: TextStyle(fontSize: 12,fontFamily: "Roboto", color: Colors.blue),) ,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ImportPage()));
                    },
                  ),
                  SizedBox(height: 5,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        onPrimary: Colors.white,
                        minimumSize: Size(250,40),
                        side: BorderSide(width: 2,color: Colors.blue),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                        )
                      ),
                      child: Text('Create a new wallet',style: TextStyle(fontSize: 12,fontFamily: "Roboto", color: Colors.white),),
                      onPressed: () { },
                  ),
                  SizedBox(height: 30),
                  Text('By procceding, you agree to these Terms and Conditions',style: TextStyle(fontSize: 11, fontFamily: "Roboto",color: Colors.black26) )
                ],
          )
        )
    );
  }
}

class ImportPage extends StatefulWidget {
  @override
  _ImportState createState() => _ImportState();
}

class _ImportState extends State<ImportPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 15,),
          Row (
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Expanded(
                  flex: 5,
                  child:Stack(
                fit: StackFit.loose,
                children:<Widget>[
                  Text(''),
                  IconButton( alignment: Alignment.topLeft,
                        onPressed: () {Navigator.pop(context);},
                        icon: const Icon(Icons.arrow_back,size: 16, )
                ),
                Positioned(
                  top: 14,
                  left: 118,
                 child: Text('METAMASK',textAlign:TextAlign.center,style: TextStyle(fontSize: 16, fontFamily:"Roboto Mono", letterSpacing: 5,fontWeight: FontWeight.normal, ),),
           )]))
            ]),
          SizedBox(height: 15,),
          Text("Import from seed",textAlign: TextAlign.center, style: TextStyle(fontSize:16, fontFamily: "Roboto", fontWeight: FontWeight.bold),),
          SizedBox(height: 15,),
       Container(
         padding: EdgeInsets.fromLTRB(15,0,15,0),
         child:Column(
           children: [
             Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Secret Recovery Phrase',style: TextStyle(fontFamily: "Roboto", fontSize: 12),),
                  Text('' )
                ],
              ),
              PasswordField(
                color: Colors.blue,
                inputDecoration: PasswordDecoration(),
                border: PasswordBorder(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    )
                ),
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('New Password',style: TextStyle(fontFamily: "Roboto", fontSize: 12),),
                  Text('' )
                ],
              ),
              PasswordField(
                  color: Colors.blue,
                  inputDecoration: PasswordDecoration(),
                  border: PasswordBorder(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    )
                  ),
            ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Confirm Password',style: TextStyle(fontFamily: "Roboto", fontSize: 12),),
                  Text('' )
                ],
              ),
              PasswordField(
                color: Colors.blue,
                inputDecoration: PasswordDecoration(),
                border: PasswordBorder(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    )
                ),
              ),
              SizedBox(height: 20,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  minimumSize: Size(350,35),
                  side: BorderSide(width: 2,color: Colors.blue),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                  )
              ),
              child: Text('Import',style: TextStyle(fontSize: 12,fontFamily: "Roboto", color: Colors.white),),
              onPressed: () { },
            )
      ])
       ),
          SizedBox(height: 15,),
        ]
      )
      )
    );
  }
  
}
