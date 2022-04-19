import 'package:passwordfield/passwordfield.dart';
import 'package:flutter/material.dart';

/*void main() {
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
      home: LoginPage(),
    );
  }
}
*/
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Container(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset("assets/logo.png"),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Welcome Back!',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter"),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      Text(
                        'Password',
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
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        onPrimary: Colors.white,
                        minimumSize: const Size(350, 40),
                        side: const BorderSide(width: 2, color: Colors.blue),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: const Text(
                      'Create a new wallet',
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "Roboto",
                          color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                      width: 250,
                      height: 30,
                      child: Text(
                        "Can't login?You can ERASE your current wallet and setup a new one",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                        style: TextStyle(fontFamily: "Roboto", fontSize: 12),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Reset Wallet',
                        style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 12,
                            fontFamily: "Roboto"),
                      ))
                ],
              ),
            )),
      ),
    );
  }
}
