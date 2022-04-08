class Transaction {

  String type;
  String name;
  String status;
  String time;
  String date;
  String from;
  String to;
  double Tamount;
  double amount = 0;
  double fee = 0;

  Transaction(this.type, this.name, this.status, this.time, this.date, this.from, this.to, this.Tamount) {
    fee = Tamount * 0.1;
    amount = Tamount - fee;
  }

// Future<void> getTime() async {
//
//   try{
//     // make the request
//     Response response = await get('http://worldtimeapi.org/api/timezone/$url');
//     Map data = jsonDecode(response.body);
//
//     // get properties from json
//     String datetime = data['datetime'];
//     String offset = data['utc_offset'].substring(0,3);
//
//     // create DateTime object
//     DateTime now = DateTime.parse(datetime);
//     now = now.add(Duration(hours: int.parse(offset)));
//
//     // set the time property
//     isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
//     time = DateFormat.jm().format(now);
//   }
//   catch (e) {
//     print(e);
//     time = 'could not get time';
//   }
//
// }

}