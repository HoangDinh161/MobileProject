import 'package:flutter/material.dart';

class ImportTokenPage extends StatefulWidget {
  const ImportTokenPage({Key? key}) : super(key: key);

  @override
  _ImportTokenState createState() => _ImportTokenState();
}

class _ImportTokenState extends State<ImportTokenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 47,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xff1890ff),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Column(children: const [
          Text("Import Token",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: "Roboto",
              )),
          Text("Smart chain",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff998b8b),
                fontSize: 9,
                fontFamily: "Roboto",
              )),
        ]),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
      ),
      body: Container(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(
                  height: 30,
                  child: Text(
                    'SEARCH',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        color: Colors.lightBlue),
                  ),
                ),
                const Divider(
                  thickness: 1,
                  height: 2,
                  color: Color(0xff1890ff),
                ),
                const SizedBox(
                  height: 10,
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
                  onPressed: () {},
                ),
              ],
            ),
          )),
    );
  }
}
