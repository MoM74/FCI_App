import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fci_project/models/fci_app/home_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../components/temp_folder.dart';
import '../../../../../layout/fci_app/cubit/cubit.dart';
import '../../../../../layout/fci_app/cubit/states.dart';
import '../../../../../shared/components/components.dart';
import '../quiz/quizes.dart';
import '../welcome/welcome_screen.dart';

class QuizHomeScreen extends StatefulWidget {
  @override
  State<QuizHomeScreen> createState() => _QuizHomeScreenState();
}

class _QuizHomeScreenState extends State<QuizHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FciCubit, FciStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            body: ConditionalBuilder(
              condition: FciCubit.get(context).homeModel != null,
              builder: (context) =>
                  builderWidget(FciCubit.get(context).homeModel!, context),
              fallback: (context) => Center(
                child: CircularProgressIndicator(),
              ),
            ));
      },
    );
  }
}

Widget builderWidget(HomeModel model, context) => SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child:Container(
            color: Colors.white,
            child: GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
              childAspectRatio: 1 / 1.5,
              children: List.generate(
                model.data.subject.length,
                (index) => buildGridProduct(model.data.subject[index], context),
              ),
            ),
          ),
    );

Widget buildGridProduct(Subject subject, context) => GestureDetector(
    child: MyFolder(
      mytext: subject.name,
      hinttext: subject.doctor,
    ),
    onTap: () {
      FciCubit.get(context).getQuizData(id: subject.pk);
      navigateTo(context, QuizesScreen());
    });
