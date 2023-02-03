class LecturesModel {
  LecturesModel({
    required this.status,
    required this.msg,
    required this.data,
  });
  late final bool status;
  late final String msg;
  late final List<Lectures> data;

  LecturesModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    msg = json['msg'];
    data = List.from(json['data']).map((e)=>Lectures.fromJson(e)).toList();
  }
}

class Lectures {
  Lectures({
    required this.pk,
    required this.name,
    required this.subject,
    required this.materialLec,
  });
  late final int pk;
  late final String name;
  late final String subject;
  late final String materialLec;

  Lectures.fromJson(Map<String, dynamic> json){
    pk = json['pk'];
    name = json['name'];
    subject = json['subject'];
    materialLec = json['material_lec'];
  }
}