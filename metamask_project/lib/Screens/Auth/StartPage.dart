

import 'package:flutter/material.dart';

import 'CreateWallet.dart';
import 'ImportPage.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size screensize = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                        const SizedBox(
                          height: 22,
                        ),
                        const Text(
                          'METAMASK',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Roboto Mono',
                              letterSpacing: 5,
                              fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Wallet Setup',
                          style: TextStyle(
                              fontSize: 18, fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'Import an existing wallet or create new one',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(height: screensize.height * 0.58),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              side: const BorderSide(width: 2,
                                  color: Colors.blue),
                              minimumSize: const Size(250, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          child: const Text(
                            'Import using Secret Recovery Phrase',
                            style: TextStyle(
                                fontSize: 12, fontFamily: 'Roboto',
                                color: Colors.blue),
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                // ignore: always_specify_types
                                MaterialPageRoute(builder:
                                    (BuildContext context)
                                => const ImportPage()));
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              onPrimary: Colors.white,
                              minimumSize: const Size(250, 40),
                              side: const BorderSide(width: 2,
                                  color: Colors.blue),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          child: const Text(
                            'Create a new wallet',
                            style: TextStyle(
                                fontSize: 12, fontFamily: 'Roboto',
                                color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                // ignore: always_specify_types
                                MaterialPageRoute(
                                    builder: (BuildContext context)
                                    => const CreateWalletPage()));
                          },
                        ),
                        const SizedBox(height: 30),
                        const Text('By proceeding, you agree to these Terms and Conditions',
                            style: TextStyle(
                                fontSize: 11, fontFamily: 'Roboto',
                                color: Colors.black26))
                      ],
                )
            )
        )
    );
  }
}
