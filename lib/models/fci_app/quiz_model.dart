class QuizModel {
  QuizModel({
    required this.status,
    required this.msg,
    required this.data,
  });
  late final bool status;
  late final String msg;
  late final Subjects data;

  QuizModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    msg = json['msg'];
    data = Subjects.fromJson(json['data']);
  }
}

class Subjects {
  Subjects({
    required this.pk,
    required this.name,
    required this.subjectQuiz,
  });
  late final int pk;
  late final String name;
  late final List<SubjectQuiz> subjectQuiz;

  Subjects.fromJson(Map<String, dynamic> json){
    pk = json['pk'];
    name = json['name'];
    subjectQuiz = List.from(json['subject_quiz']).map((e)=>SubjectQuiz.fromJson(e)).toList();
  }
}

class SubjectQuiz {
  SubjectQuiz({
    required this.pk,
    required this.title,
    required this.subject,
    required this.numOfQuestion,
    required this.question,
  });
  late final int pk;
  late final String title;
  late final int subject;
  late final int numOfQuestion;
  late final List<Question> question;

  SubjectQuiz.fromJson(Map<String, dynamic> json){
    pk = json['pk'];
    title = json['title'];
    subject = json['subject'];
    numOfQuestion = json['num_of_question'];
    question = List.from(json['question']).map((e)=>Question.fromJson(e)).toList();
  }
}

class Question {
  Question({
    required this.title,
    required this.answer,
  });
  late final String title;
  late final List<Answer> answer;

  Question.fromJson(Map<String, dynamic> json){
    title = json['title'];
    answer = List.from(json['answer']).map((e)=>Answer.fromJson(e)).toList();
  }
}

class Answer {
  Answer({
    required this.answerText,
    required this.isRight,
  });
  late final String answerText;
  late final bool isRight;

  Answer.fromJson(Map<String, dynamic> json){
    answerText = json['answer_text'];
    isRight = json['is_right'];
  }
}