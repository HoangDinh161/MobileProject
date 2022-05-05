import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:metamask_project/Screens/Home/Home.dart';
import 'package:metamask_project/Services/CoinFromCoingecko.dart';

import '../../Models/Coin.dart';
import '../../Services/Database.dart';

class BuyPage extends StatefulWidget {
  const BuyPage({Key? key}) : super(key: key);

  @override
  _BuyState createState() => _BuyState();
}

class _BuyState extends State<BuyPage> {
  late Coin dropdownValue = Coin('id', 'name', 'symbol', 'image');
  List<Coin> coinList = [];
  TextEditingController _amountController = TextEditingController();

  @override
  void initState() {
    getList();
  }

  getList() async {
    coinList = await getCoinList();
    dropdownValue = coinList[0];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Purchase Method',
            style: TextStyle(
                fontSize: 16, fontFamily: "Roboto", color: Colors.black),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          toolbarHeight: 47,
          actions: [
            TextButton(
              child: const Text(
                'Cancel',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: "Roboto",
                    color: Colors.blueAccent),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
        body: Column(
          children: [
            DropdownButton<Coin>(
              value: dropdownValue,
              onChanged: (Coin? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: coinList.map<DropdownMenuItem<Coin>>((Coin value) {
                return DropdownMenuItem<Coin>(
                  value: value,
                  child: Row(
                    children: [
                      Image.network(
                        value.image,
                        width: 20,
                      ),
                      Text(
                        value.symbol.toUpperCase(),
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Miriam Libre',
                          fontSize: 14,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
            Container(
              height: 80,
              padding: EdgeInsets.fromLTRB(15,10,15,10),
              child:TextFormField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              decoration: const InputDecoration(
                label: Text(
                  'Amount',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(153, 140, 140, 1),
                    fontFamily: 'Roboto',
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  borderSide: BorderSide(width: 1.0),
                ),
              ),
            ),),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  minimumSize: const Size(350, 30),
                  side: const BorderSide(width: 2, color: Colors.blue),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              child: const Text(
                'Buy',
                style: TextStyle(
                    fontSize: 12, fontFamily: "Roboto", color: Colors.white),
              ),
              onPressed: () async {
                if (await DatabaseService().buyCoin(dropdownValue, _amountController.text)) {
                  Future.delayed(Duration(milliseconds: 500), () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHomePage()));
                  });
                }
              },
            ),
          ],
        ));
  }
}
