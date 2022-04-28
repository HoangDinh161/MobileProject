import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Models/Coin.dart';

Future<List<Coin>> getCoinList() async {
  List<Coin> coinList = [];
  try{
    var url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=falses";
    var respond = await http.get(url);
    var json = jsonDecode(respond.body);
    for (var c in json) {
      coinList.add(Coin(c['id'].toString(), c['name'].toString(), c['symbol'].toString(), c['image'].toString()));
    }
    return coinList;
  }catch(e){
    print(e);
    return coinList;
  }
}