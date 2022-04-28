import 'package:flutter/material.dart';
import 'package:metamask_project/Services/CoinFromCoingecko.dart';
import '../../Models/Coin.dart';
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
                    fontSize: 12, fontFamily: "Roboto", color: Colors.blueAccent),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
        body:Column(
          children: [
          DropdownButton<Coin>(
          value: dropdownValue,
          // icon: const Icon(Icons.arrow_downward),
          // elevation: 16,
          // style: const TextStyle(color: Colors.deepPurple),
          // underline: Container(
          //   height: 2,
          //   color: Colors.deepPurpleAccent,
          // ),
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
                  Text(value.symbol, textAlign: TextAlign.left, style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Miriam Libre',
                      fontSize: 14,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ],
              ),
            );
            }).toList(),
            ),
            TextFormField(
              controller: _amountController,
              decoration: const InputDecoration(
                label: Text('Amount', textAlign: TextAlign.left, style: TextStyle(
                    color: Color.fromRGBO(153, 140, 140, 1),
                    fontFamily: 'Roboto',
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                ),),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  borderSide: BorderSide(width: 1.0),
                ),
              ),

            )
          ],
        )
    );
  }
}