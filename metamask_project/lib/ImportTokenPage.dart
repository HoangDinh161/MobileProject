import 'package:flutter/material.dart';
import 'package:metamask_project/Screens/Home/Home.dart';

import 'Models/Coin.dart';
import 'Services/CoinFromCoingecko.dart';

class ImportTokenPage extends StatefulWidget {
  const ImportTokenPage({Key? key}) : super(key: key);

  @override
  _ImportTokenState createState() => _ImportTokenState();
}

class _ImportTokenState extends State<ImportTokenPage> {
  List<Coin> coinList = [];
  List<Coin> foundTokens = [];
  Coin _tokenChose = Coin('id', 'name', 'symbol', 'image');
  int selectedIndex = -1;
  @override
  void initState() {
    super.initState();
    getList();
    foundTokens = coinList;
  }

  getList() async {
    coinList = await getCoinList();
    setState(() {});
  }

  void _runFilter(String enteredKeyword) {
    List<Coin> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all tokens
      results = coinList;
    } else {
      results = coinList
          .where((token) => token.name.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
    // Refresh the UI
    setState(() {
      foundTokens = results;
    });
  }
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
                TextField(
                  onChanged: (value) => _runFilter(value),
                  decoration: const InputDecoration(
                      labelText: 'Search', suffixIcon: Icon(Icons.search)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: foundTokens.isNotEmpty
                      ? ListView.builder(
                          itemCount: foundTokens.length,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () => setState(() {
                              selectedIndex = index;
                              _tokenChose = foundTokens[index];
                            }),
                            child: Card(
                              shape: (selectedIndex == index)
                                  ? const RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.green))
                                  : null,
                            key: ValueKey(foundTokens[index].id),
                            elevation: 5,
                            margin: const EdgeInsets.symmetric(vertical: 5),
                                child: ListTile(
                                    leading: Image.network(
                                    foundTokens[index].image,
                                      width: 20,
                                    ),
                                    title: Text(foundTokens[index].name),
                      ),
                    )),
                  )
                      : const Text(
                    'No results found',
                    style: TextStyle(fontSize: 16),
                  ),
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
                  onPressed: () {
                    // viết code xử lí import ở đây,import  _tokenChose vào walletList.
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyHomePage()));
                  },
                ),
              ],
            ),
          )),
    );
  }
}
