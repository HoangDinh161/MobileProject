
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:metamask_project/Services/Auth.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:provider/provider.dart';
import '../../Services/CreatePhrase.dart';
import '../Home/Home.dart';



class CreateWalletPage extends StatefulWidget {
  const CreateWalletPage({Key? key}) : super(key: key);

  @override
  _CreateWalletState createState() => _CreateWalletState();
}

class _CreateWalletState extends State<CreateWalletPage> {
  Phrase p = Phrase();
  final TextEditingController _password1 = TextEditingController();
  final TextEditingController _password2 = TextEditingController();
  final TextEditingController _password3 = TextEditingController();

  final AuthService _auth = AuthService();

  int _currentstep = 0;
  int step_2 = 0;
  void onContinue() {
    if (_currentstep == 1&&step_2 == 0) {
      setState(() {
        step_2 = 1;
        _currentstep = 1;
      });
    }
    else if (_currentstep < stepLiLt().length - 1) {
      setState(() {
        _currentstep += 1;
      });
    }
  }

  void onBack() {
    if (_currentstep == 0) {
      return;
    }
    if (_currentstep == 1&&step_2 == 1) {
      setState(() {
        step_2 = 0;
        _currentstep =1;
      });
    }
    else {
      setState(() {
        _currentstep -= 1;
      });
    }
  }

  List<Step> stepLiLt() => [
    Step(
      state: _currentstep <= 0 ? StepState.editing : StepState.complete,
      isActive: _currentstep >= 0,
      title: const Text(
        'Create password',
        overflow: TextOverflow.visible,
        style: TextStyle(
            fontSize: 6, fontFamily: "Roboto", color: Colors.blueAccent),
      ),
      content: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Create Password',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'This password will unlock your MetaMask wallet only on this device.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 11, fontFamily: "Roboto"),
              ),
              const SizedBox(
                height: 3,
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Column(children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Text(
                          'New Password',
                          style: TextStyle(fontFamily: "Roboto", fontSize: 12),
                        ),
                        Text('')
                      ],
                    ),
                    SizedBox(
                        height: 70,
                        child: PasswordField(
                          controller: _password1,
                          color: Colors.blue,
                          errorMessage: '''
                                  - A minimum length of 8 characters
                                ''',
                          inputDecoration: PasswordDecoration(),
                          border: PasswordBorder(
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.blueAccent,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                              BorderSide(width: 2, color: Colors.red.shade200),
                            ),
                          ),

                        )
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Text(
                          'Confirm Password',
                          style: TextStyle(fontFamily: "Roboto", fontSize: 12),
                        ),
                        Text('')
                      ],
                    ),
                    SizedBox(
                        height: 70,
                        child: PasswordField(
                          controller: _password2,
                          color: Colors.blue,
                          inputDecoration: PasswordDecoration(),
                          border: PasswordBorder(
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.blueAccent,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                              BorderSide(width: 2, color: Colors.red.shade200),
                            ),
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                          minimumSize: const Size(350, 35),
                          side: const BorderSide(width: 2, color: Colors.blue),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      child: const Text(
                        'Create Password',
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Roboto",
                            color: Colors.white),
                      ),
                      onPressed: onContinue,
                    )
                  ])
              ),
            ],
          )),
    ),
    Step(
      state: _currentstep <= 1 ? StepState.editing : StepState.complete,
      isActive: _currentstep >= 1,
      title: const Text(
        'Secure wallet',
        overflow: TextOverflow.clip,
        style: TextStyle(
            fontSize: 6, fontFamily: "Roboto", color: Colors.blueAccent),
      ),
      content: SingleChildScrollView(
          child: step_2 == 0 ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Confirm your password',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 20, fontFamily: "Roboto", color: Colors.black),
              ),
              const SizedBox(
                height: 3,
              ),
              const Text(
                'Before continuing we need to confirm your password',
                textAlign: TextAlign.left,
                style: TextStyle(fontFamily: "Roboto", fontSize: 12),
              ),
              const SizedBox(
                height: 3,
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
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    minimumSize: const Size(350, 35),
                    side: const BorderSide(width: 2, color: Colors.blue),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                child: const Text(
                  'Confirm',
                  style: TextStyle(
                      fontSize: 12, fontFamily: "Roboto", color: Colors.white),
                ),
                onPressed: onContinue,
              )
            ],
          ) : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text('Write down your Secret Recovery Phrase',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "This is your Secret Recovery Phrase. Write it down on a paper or keep in a safe place. You'll be asked to re-enter this phrase (in order) on the next step.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 9, fontFamily: "Roboto"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ListPhraseView(p: p),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                      minimumSize: const Size(350, 35),
                      side: const BorderSide(width: 2, color: Colors.blue),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Roboto",
                        color: Colors.white),
                  ),
                  onPressed: onContinue,
                ),
              )
            ],
          )
      ),
    ),
    Step(
        state: _currentstep <= 2 ? StepState.editing : StepState.complete,
        isActive: _currentstep >= 2,
        title: const Text('Confirm Secret Recovery Phrase',
            overflow: TextOverflow.clip,
            style: TextStyle(
                fontSize: 6,
                fontFamily: "Roboto",
                color: Colors.blueAccent)),
        content: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text('Confirm Secret Recovery Phrase',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Select  each word in the order it was presented to you.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 9, fontFamily: "Roboto"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextListView(p: p),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                      minimumSize: const Size(350, 35),
                      side: const BorderSide(width: 2, color: Colors.blue),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Roboto",
                        color: Colors.white),
                  ),
                  onPressed: () async {
                    dynamic result = context.read<AuthService>().newWallet(
                      p.phrases,
                      _password1.text,
                      'Account',
                    ).then((value) async{
                      User user = FirebaseAuth.instance.currentUser;
                      await FirebaseFirestore.instance.collection("user").doc(user.uid).set({
                        'uid': user.uid,
                        'phrase': p.phrases,
                        'username': 'Account',
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyHomePage()));
                    });
                  },
                ),
              )
            ],
          ),
        )),
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
              Row(mainAxisAlignment: MainAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 1,
                        child: IconButton(
                            alignment: Alignment.centerLeft,
                            onPressed: () {
                              _currentstep <= 0 ? Navigator.pop(context) : onBack();
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              size: 16,
                            ))),
                    const Expanded(
                        flex: 3,
                        child: Text('METAMASK',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Roboto Mono",
                              letterSpacing: 5,
                              fontWeight: FontWeight.normal,
                            ))),
                    const Expanded(
                      flex: 1,
                      child: Text(''),
                    )
                  ]),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: Stepper(
                    steps: stepLiLt(),
                    type: StepperType.horizontal,
                    currentStep: _currentstep,
                    controlsBuilder: (BuildContext context, ControlsDetails details) {
                      return const SizedBox();
                    },
                  ))
            ]));
  }
}

class TextListView extends StatelessWidget {
  const TextListView({required this.p, Key? key }) : super(key: key);
  final Phrase p;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 300,
      padding: const EdgeInsets.fromLTRB(10,0,10,10),
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.grey,
            style: BorderStyle.solid,
            width: 2.0
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: GridView.builder(
        itemCount: 12,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 5,
            childAspectRatio: 4),
        itemBuilder: (BuildContext context, int index) {
          return TxtView(index: index+1, slist: p.stringList(),);
        },
      ),
    );
  }
}

class TxtView extends StatefulWidget {
  const TxtView({required this.index, required this.slist ,Key? key }) : super(key: key);
  final int index;
  final List<String> slist;
  @override
  State<TxtView> createState() => _TxtViewState();
}

class _TxtViewState extends State<TxtView> {
  bool right = false;
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      if(controller.text.toLowerCase() == widget.slist[widget.index-1]) {
        setState(() {
          right = true;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        label: Text(widget.index.toString()+'.'),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          borderSide: BorderSide(width: 1.0),
        ),

      ),
      controller: controller,
    );
  }
}
