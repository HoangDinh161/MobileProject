class user {
  user({required this.username, required this.uid,});
  String username;
  String uid;


  String short() {
    return uid.substring(0, 7) + '...' + uid.substring(uid.length -5, uid.length);
  }

}