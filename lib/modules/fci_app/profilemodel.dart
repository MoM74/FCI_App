// class ProfileModel {
//   ProfileModel({
//     required this.status,
//     required this.msg,
//     required this.data,
//   });
//   late final bool status;
//   late final String msg;
//   late final Data data;
//
//   ProfileModel.fromJson(Map<String, dynamic> json){
//     status = json['status'];
//     msg = json['msg'];
//     data = Data.fromJson(json['data']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['status'] = status;
//     _data['msg'] = msg;
//     _data['data'] = data.toJson();
//     return _data;
//   }
// }
//
// class Data {
//   Data({
//     required this.email,
//     required this.username,
//     required this.fullname,
//     required this.about,
//     required this.gender,
//     required this.image,
//     required this.dateOfBirth,
//     required this.userPosts,
//   });
//   late final String email;
//   late final String username;
//   late final String fullname;
//   late final String about;
//   late final String gender;
//   late final String image;
//   late final String dateOfBirth;
//   late final List<UserPosts> userPosts;
//
//   Data.fromJson(Map<String, dynamic> json){
//     email = json['email'];
//     username = json['username'];
//     fullname = json['fullname'];
//     about = json['about'];
//     gender = json['gender'];
//     image = json['image'];
//     dateOfBirth = json['date_of_birth'];
//     userPosts = List.from(json['user_posts']).map((e)=>UserPosts.fromJson(e)).toList();
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['email'] = email;
//     _data['username'] = username;
//     _data['fullname'] = fullname;
//     _data['about'] = about;
//     _data['gender'] = gender;
//     _data['image'] = image;
//     _data['date_of_birth'] = dateOfBirth;
//     _data['user_posts'] = userPosts.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }
//
// class UserPosts {
//   UserPosts({
//     required this.id,
//     required this.user,
//     required this.body,
//     this.image,
//     required this.createdAt,
//     required this.postComments,
//   });
//   late final int id;
//   late final String user;
//   late final String body;
//   late final Null image;
//   late final String createdAt;
//   late final List<PostComments> postComments;
//
//   UserPosts.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     user = json['user'];
//     body = json['body'];
//     image = null;
//     createdAt = json['created_at'];
//     postComments = List.from(json['post_comments']).map((e)=>PostComments.fromJson(e)).toList();
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['user'] = user;
//     _data['body'] = body;
//     _data['image'] = image;
//     _data['created_at'] = createdAt;
//     _data['post_comments'] = postComments.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }
//
// class PostComments {
//   PostComments({
//     required this.id,
//     required this.user,
//     required this.body,
//     required this.createdAt,
//   });
//   late final int id;
//   late final String user;
//   late final String body;
//   late final String createdAt;
//
//   PostComments.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     user = json['user'];
//     body = json['body'];
//     createdAt = json['created_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['user'] = user;
//     _data['body'] = body;
//     _data['created_at'] = createdAt;
//     return _data;
//   }
// }