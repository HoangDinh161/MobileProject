import 'package:flutter/material.dart';
import 'package:metamask_project/Models/wallet.dart';

import '../../ImportTokenPage.dart';
import '../../Services/CoinFromCoingecko.dart';

class WalletList extends StatelessWidget{
  WalletList({required this.wallets,Key? key}) : super(key: key);
  List<wallet>? wallets;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        children: [
          Container(
              height: 200,
              padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: wallets?.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(1.0),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 0.3)
                        )
                    ),
                    child: WalletTile(
                      w: wallets![index],
                    ),
                  );
                },
              )
          ),
          Padding(
              padding: const EdgeInsets.only(top:10),
              child:SizedBox(
                width: 110,
                height: 70,
                child: Column(
                  children:  [
                    const Text(
                      "Don’t see your token ?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff979797),
                        fontSize: 11,
                        fontFamily: "Roboto",
                      ),
                    ),
                    TextButton(
                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> const ImportTokenPage()));},
                        child: const Text(
                          "Import Tokens",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff1890ff),
                            fontSize: 11,
                            fontFamily: "Roboto",
                          ),
                        )
                    )
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}

class WalletTile extends StatefulWidget{
  const WalletTile({required this.w, Key? key}) : super(key: key);
  final wallet w;

  @override
  State<WalletTile> createState() => _WalletTileState();
}

class _WalletTileState extends State<WalletTile> {
  double usd = 0.0;

  @override
  initState() {
    updateValues();
  }

  updateValues() async {
    usd = await getUSD(widget.w.coin.id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    getValue(String id, double amount)  {
      return (usd * amount).toStringAsFixed(2);
    }
    // TODO: implement build
    return ListTile(
      dense:true,
      onTap: (){},
      leading: SizedBox(
        height: 20,
        width: 20,
        child: Image.network(
          widget.w.coin.image,
        ),
      ),

      title: Text(widget.w.amount.toString() + " ${widget.w.coin.symbol.toUpperCase()}"),
      subtitle: Text("${getValue(widget.w.coin.id, widget.w.amount)} USD"),
      trailing: const Icon(Icons.arrow_right),
    );
  }

}
