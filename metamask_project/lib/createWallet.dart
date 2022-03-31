import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';

class CreateWalletPage extends StatefulWidget {
  const CreateWalletPage({Key? key}) : super(key: key);

  @override
  _CreateWalletState createState() => _CreateWalletState();

}
class _CreateWalletState extends State<CreateWalletPage> {
  int _currentstep = 0;
  void onContinue() {
    if (_currentstep < stepLiLt().length -1) {
          setState(() {
            _currentstep+=1;
          });
    }
  }
  void onBack() {
    if (_currentstep == 0) {
      return;
    }
    setState(() {
      _currentstep -= 1;
    });
  }

  List<Step> stepLiLt() => [
        Step(
          title: const Text('Create password',style: TextStyle(fontSize: 9,fontFamily: "Roboto",color: Colors.blueAccent),),
          content: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children:  [
                    const Text('Create Password',textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, fontFamily: "Roboto",fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10,),
                    const Text('This password will unlock your MetaMask wallet only on this device.',textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 11, fontFamily: "Roboto"),),
                    const SizedBox(height: 3,),
                    Container(
                      padding: const EdgeInsets.fromLTRB(15,0,15,0),
                      child: Column(
                          children: [
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
                              child: const Text('Create Password',style: TextStyle(fontSize: 12,fontFamily: "Roboto", color: Colors.white),),
                              onPressed: onContinue,
                            )
                          ])
                  ),
                ],
              ),
          )
        ),
        Step(
          title: const Text('Secure wallet',style: TextStyle(fontSize: 9,fontFamily: "Roboto",color: Colors.blueAccent),
              ),
          content: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('Confirm your password', textAlign: TextAlign.left,style: TextStyle(fontSize: 20,fontFamily: "Roboto",color: Colors.black),),
                    const SizedBox(height:3 ,),
                    const Text('Before continuing we need to confirm your password',textAlign: TextAlign.left,style: TextStyle(fontFamily: "Roboto",fontSize: 12),),
                    const SizedBox(height: 3,),
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
                      child: const Text('Create Password',style: TextStyle(fontSize: 12,fontFamily: "Roboto", color: Colors.white),),
                      onPressed: onContinue,
                    )
                  ],
          ),
          )
        ),
        const Step(
          title: Text('Confirm Secret Recovery Phrase', style: TextStyle(fontSize: 9,fontFamily: "Roboto",color: Colors.blueAccent)),
          content: SingleChildScrollView(

  )
          ),
        ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stepper(
        steps: stepLiLt(),
        type: StepperType.vertical,

      )
    );
  }

}