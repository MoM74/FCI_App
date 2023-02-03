import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../../layout/fci_app/fci_layout.dart';
import '../../../../../shared/components/components.dart';
import '../../constants.dart';
import '../../controllers/question_controller.dart';
import '../../../../../layout/fci_app/cubit/cubit.dart';
import '../../../../../layout/fci_app/cubit/states.dart';
import '../../../../../models/fci_app/quiz_model.dart';

class MyGrade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FciCubit, FciStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'My Quiz grade',
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.forward,
                ),
                onPressed: () {
                  navigateTo(context, FciLayout(),);
                },
              ),
            ],
          ),
          body: ConditionalBuilder(
            condition: FciCubit
                .get(context)
                .quizModel != null,
            builder: (context) =>
                builderQuizWidget(FciCubit
                    .get(context)
                    .quizModel!, context),
            fallback: (context) =>
            const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}

Widget builderQuizWidget(QuizModel model, context) =>
    SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(
              model.data.subjectQuiz.length,
                  (index) =>
                  buildGridQuizes(model,model.data.subjectQuiz[index], context),
            ),
          ),
        ],
      ),
    );

QuestionController _qnController = Get.put(QuestionController());

Widget buildGridQuizes(QuizModel model, SubjectQuiz subjectQuiz, context) =>
    Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(

        width: double.infinity,

        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(15.0),

          color: Colors.white54,

          boxShadow: [

            BoxShadow(

              color: Colors.grey.shade300,

            ),

          ],

        ),

        child: Padding(

          padding: const EdgeInsets.all(8.0),

          child: Row(

            children: [

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.data.name ,

                    style: TextStyle(

                        fontWeight: FontWeight.bold,

                        fontSize: 20,

                        color: Colors.black),

                  ),
                  SizedBox(height: 10,),
                  Text(subjectQuiz.title,

                    style: TextStyle(

                        fontWeight: FontWeight.normal,

                        fontSize: 15,

                        color: Colors.black),

                  ),

                ],),

              SizedBox(width: 100.0,),

              Text(

                "${_qnController.correctAns }/${_qnController.questions
                    .length }",

                style: TextStyle(

                    fontWeight: FontWeight.bold,

                    fontSize: 20,

                    color: Colors.grey),


              ),

            ],

          ),

        ),

      ),
    );
