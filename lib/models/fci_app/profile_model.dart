
class ProfileModel {
  ProfileModel({
    required this.status,
    required this.msg,
    required this.data,
  });
  late final bool status;
  late final String msg;
  late final Data data;

  ProfileModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    msg = json['msg'];
    data = Data.fromJson(json['data']);
  }

}

class Data {
  Data({
    required this.email,
    required this.username,
    required this.fullname,
    required this.about,
    required this.gender,
    required this.image,
    required this.dateOfBirth,
    required this.userPosts,
  });
  late final String email;
  late final String username;
  late final String fullname;
  late final String about;
  late final String gender;
  late final String image;
  late final String dateOfBirth;
  late final List<UserPosts> userPosts;

  Data.fromJson(Map<String, dynamic> json){
    email = json['email'];
    username = json['username'];
    fullname = json['fullname'];
    about = json['about'];
    gender = json['gender'];
    image = json['image'];
    dateOfBirth = json['date_of_birth'];
    userPosts = List.from(json['user_posts']).map((e)=>UserPosts.fromJson(e)).toList();
  }
}

class UserPosts {
  UserPosts({
    required this.id,
    required this.user,
    required this.body,
    this.image,
    required this.createdAt,
    required this.postComments,
  });
  late final int id;
  late final User user;
  late final String body;
  late final String? image;
  late final String createdAt;
  late final List<PostComments> postComments;

  UserPosts.fromJson(Map<String, dynamic> json){
    id = json['id'];
    user = User.fromJson(json['user']);
    body = json['body'];
    image = null;
    createdAt = json['created_at'];
    postComments = List.from(json['post_comments']).map((e)=>PostComments.fromJson(e)).toList();
  }
}

class User {
  User({
    required this.fullname,
    required this.image,
  });
  late final String fullname;
  late final String image;

  User.fromJson(Map<String, dynamic> json){
    fullname = json['fullname'];
    image = json['image'];
  }

}

class PostComments {
  PostComments({
    required this.id,
    required this.user,
    required this.createdAt,
    required this.body,
  });
  late final int id;
  late final User user;
  late final String createdAt;
  late final String body;

  PostComments.fromJson(Map<String, dynamic> json){
    id = json['id'];
    user = User.fromJson(json['user']);
    createdAt = json['created_at'];
    body = json['body'];
  }

}