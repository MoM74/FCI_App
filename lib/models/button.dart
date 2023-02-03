class ButtonList {
  late final int ID;
  late final String EnglishName;
  late final String ArabicName;
  late final String Link;
  late final int UIGID;
  late final bool Active;
  late final bool IsDeleted;

  ButtonList.fromJson(Map<String, dynamic> json) {
    ID = json['ID'];
    EnglishName = json['EnglishName'];
    ArabicName = json['ArabicName'];
    Link = json['Link'];
    UIGID = json['UIG_ID'];
    Active = json['Active'];
    IsDeleted = json['IsDeleted'];
  }
}

class UserModel {
  late final String name;
  late final String image;
  late final String title;

  UserModel({
    required this.image,
    required this.title,
    required this.name,
  });
}
