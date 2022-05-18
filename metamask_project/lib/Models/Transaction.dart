// ignore_for_file: lines_longer_than_80_chars

class Trans {
  Trans( this.type, this.name, this.status, this.time, this.date,
      this.from, this.to, this.Tamount, this.amount, this.fee);
  String type;
  String name;
  String status;
  String time;
  String date;
  String from;
  String to;
  double Tamount;
  double amount;
  double fee;



  String shortFrom() {
    if (type == 'Buy') {
      return 'Admin';
    }
    return from.substring(0, 7) + '...' + from.substring(from.length -5, from.length);
  }
  String shortTo() {
    return to.substring(0, 7) + '...' + to.substring(to.length -5, to.length);
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
