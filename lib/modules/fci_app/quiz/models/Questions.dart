class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({required this.id, required this.question, required this.answer, required this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question":
        "Flutter is an open-source UI software development kit created by ______",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "When google release Flutter.",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "A memory location that holds a single letter or number.",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": "What command do you use to output data to the screen?",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": 2,
  },
  {
    "id": 5,
    "question":
    "Flutter is used to develop applications for _ and _.",
    "options": ['Android', 'iOS', 'Both', 'None'],
    "answer_index": 3,
  },
  {
    "id": 6,
    "question": "Flutter apps are written in the __ language and make use of many of the language’s more advanced features.",
    "options": ['Dart', 'Kotlin', 'Java', 'Swift'],
    "answer_index": 1,
  },
  {
    "id": 7,
    "question": "Which function is responsible for starting the program?",
    "options": ['runApp()', 'main()', 'run()', 'flutter()'],
    "answer_index": 2,
  },
  {
    "id": 8,
    "question": "SDK represents____",
    "options": ['Software Development Knowledge', 'Software Data Kit', 'Software Database Kit', 'Software Development Kit'],
    "answer_index": 4,
  },
  {
    "id": 9,
    "question": "What are the advantages of Flutter?",
    "options": ['Cross-platform Development', 'Faster Development', 'UI Focused', 'All of the above'],
    "answer_index": 4,
  },
  {
    "id": 10,
    "question": "Which widget enables us to have a specific height or width between the widgets?",
    "options": ['AppBar', 'SafeArea', 'onChanged', 'SizedBox'],
    "answer_index": 4,
  },
];
