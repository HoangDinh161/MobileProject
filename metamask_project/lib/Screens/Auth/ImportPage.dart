import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';

import '../../Services/Auth.dart';
import '../Home/Home.dart';

class ImportPage extends StatefulWidget {
  const ImportPage({Key? key}) : super(key: key);

  @override
  _ImportState createState() => _ImportState();
}

class _ImportState extends State<ImportPage> {
  TextEditingController _phrases = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _reNewPassword = TextEditingController();

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 1,
                    child: IconButton(
                        alignment: Alignment.centerLeft,
                        onPressed: () {
                          Navigator.pop(context);
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
          const Text(
            "Import from seed",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text(
                      'Secret Recovery Phrase',
                      style: TextStyle(fontFamily: "Roboto", fontSize: 12),
                    ),
                    Text('')
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
                  )),
                ),
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
                    'Import',
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Roboto",
                        color: Colors.white),
                  ),
                  onPressed: () async {
                    if (await _auth.import(_phrases.text, _password.text)) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyHomePage()));
                    } else {

                    }
                  },
                )
              ])),
          const SizedBox(
            height: 15,
          ),
        ])));
  }
}
