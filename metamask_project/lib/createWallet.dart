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
          state: _currentstep <=0 ? StepState.editing : StepState.complete ,
          isActive: _currentstep >=0,
          title: const Text('Create password',overflow: TextOverflow.visible,style: TextStyle(fontSize: 6,fontFamily: "Roboto",color: Colors.blueAccent),),
          content: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
          state: _currentstep <=1? StepState.editing : StepState.complete,
          isActive: _currentstep>=1,
          title: const Text('Secure wallet',overflow: TextOverflow.clip,style: TextStyle(fontSize: 6,fontFamily: "Roboto",color: Colors.blueAccent),
              ),
          content: SingleChildScrollView(
                child:Column(
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
                      child: const Text('Confirm',style: TextStyle(fontSize: 12,fontFamily: "Roboto", color: Colors.white),),
                      onPressed: onContinue,
                    )
                  ],
          ),
          )
        ),
          Step(
            state: _currentstep <=2? StepState.editing : StepState.complete,
            isActive: _currentstep>=2,
          title: const Text('Confirm Secret Recovery Phrase',overflow: TextOverflow.clip, style: TextStyle(fontSize: 6,fontFamily: "Roboto",color: Colors.blueAccent)),
          content: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text('Write down your Secret Recovery Phrase',textAlign: TextAlign.center, style: TextStyle(fontSize: 15, fontFamily: "Roboto",fontWeight: FontWeight.bold)),
                    SizedBox(height: 5,),
                    Text("This is your Secret Recovery Phrase. Write it down on a paper or keep in a safe place. You'll be asked to re-enter this phrase (in order) on the next step."
                    ,textAlign: TextAlign.center, style: TextStyle(fontSize: 9,fontFamily: "Roboto"),)
                  ],
                ),
          )
          ),
        ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 25),
              Row (
                  mainAxisAlignment: MainAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Expanded(
                        flex: 1,
                        child: IconButton(
                            alignment: Alignment.centerLeft,
                            onPressed: () {_currentstep <= 0 ?Navigator.pop(context): onBack();},
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
              const SizedBox(height: 10,),
              Expanded(
                  child:Stepper(
                    steps: stepLiLt(),
                    type: StepperType.horizontal,
                    currentStep: _currentstep,
                    controlsBuilder: (BuildContext context, ControlsDetails details) {
                      return const SizedBox();
                    },
              )
              )
            ]
        )
    );
  }

}