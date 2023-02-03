class HomeModel {
  HomeModel({
    required this.status,
    required this.msg,
    required this.data,
  });
  late final bool status;
  late final String msg;
  late final Data data;

  HomeModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    msg = json['msg'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  Data({
    required this.depName,
    required this.level,
    required this.subject,
  });
  late final String depName;
  late final int level;
  late final List<Subject> subject;

  Data.fromJson(Map<String, dynamic> json){
    depName = json['dep_name'];
    level = json['level'];
    subject = List.from(json['subject']).map((e)=>Subject.fromJson(e)).toList();
  }
}

class Subject {
  Subject({
    required this.pk,
    required this.name,
    required this.doctor,
    required this.fullDgree,
    required this.passDegree,
  });
  late final int pk;
  late final String name;
  late final String doctor;
  late final int fullDgree;
  late final int passDegree;

  Subject.fromJson(Map<String, dynamic> json){
    pk = json['pk'];
    name = json['name'];
    doctor = json['doctor'];
    fullDgree = json['full_dgree'];
    passDegree = json['pass_degree'];
  }
}