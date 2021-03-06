import 'package:flutter/material.dart';
import 'package:metamask_project/Services/Database.dart';
import 'package:provider/single_child_widget.dart';
import 'Screens/Auth/StartPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'Screens/Home/Home.dart';
import 'Services/Auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
        // ignore: always_specify_types
        StreamProvider(
          create: (BuildContext context)
          => context.read<AuthService>().authStateChanges,
        ),
      ],
      child: const MaterialApp(
        title: 'APP',
        home: AuthWrapper(),
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget{
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = context.watch<User>();
    if(user != null){
      return Provider<DatabaseService>(
          create: (_) => DatabaseService(),
          child: const MyHomePage()
      );
    }
    return const StartPage();
  }

}
