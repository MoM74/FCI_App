class NewsFeedModel {
  NewsFeedModel({
    required this.status,
    required this.msg,
    required this.data,
  });
  late final bool status;
  late final String msg;
  late final List<Post> data;

  NewsFeedModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    msg = json['msg'];
    data = List.from(json['data']).map((e)=>Post.fromJson(e)).toList();
  }

}

class Post {
  Post({
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
  late final List<Comments> postComments;

  Post.fromJson(Map<String, dynamic> json){
    id = json['id'];
    user = User.fromJson(json['user']);
    body = json['body'];
    image = null;
    createdAt = json['created_at'];
    postComments = List.from(json['post_comments']).map((e)=>Comments.fromJson(e)).toList();
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

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fullname'] = fullname;
    _data['image'] = image;
    return _data;
  }
}

class Comments {
  Comments({
    required this.id,
    required this.user,
    required this.createdAt,
    required this.body,
  });
  late final int id;
  late final User user;
  late final String createdAt;
  late final String body;

  Comments.fromJson(Map<String, dynamic> json){
    id = json['id'];
    user = User.fromJson(json['user']);
    createdAt = json['created_at'];
    body = json['body'];
  }

}