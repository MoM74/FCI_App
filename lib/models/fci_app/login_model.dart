class FciLoginModel {
  FciLoginModel({
    required this.status,
    required this.token,
    //required this.msg,
    required this.userType,

  });
  late final bool status;
  late final String token;
  //late final String msg;
  late final String userType;

  FciLoginModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    token = json['token'];
    //msg = json['msg'];
    userType = json['user_type'];
  }
}