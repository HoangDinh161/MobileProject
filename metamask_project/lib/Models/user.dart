class user {
  String username;
  String uid;

  user({required this.username, required this.uid,});
  String short() {
    return uid.substring(0, 7) + "..." + uid.substring(uid.length -5, uid.length);
  }

}