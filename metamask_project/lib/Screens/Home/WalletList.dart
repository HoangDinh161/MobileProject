import 'package:flutter/material.dart';
import 'package:metamask_project/Models/wallet.dart';

import '../../ImportTokenPage.dart';
import '../../Services/Database.dart';

class WalletList extends StatelessWidget{
  const WalletList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamBuilder<List<wallet>>(
        stream: DatabaseService().walletList,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            List<wallet>? wallets = snapshot.data;
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
                                    top: BorderSide(width: 0.2),
                                    bottom: BorderSide(width: 0.3)
                                  )
                                ),
                                child: walletTile(
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

          } else {
            return const SizedBox(

            );
          }
        }
    );
  }
}

class walletTile extends StatelessWidget{
  const walletTile({required this.w, Key? key}) : super(key: key);
  final wallet w;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      dense:true,
      onTap: (){},
      leading: SizedBox(
        height: 20,
        width: 20,
        child: Image.network(
          w.coin.image,
        ),
      ),

      title: Text(w.amount.toString() + " ${w.coin.symbol.toUpperCase()}"),
      subtitle: Text('usd'),
      trailing: const Icon(Icons.arrow_right),
    );
  }

}