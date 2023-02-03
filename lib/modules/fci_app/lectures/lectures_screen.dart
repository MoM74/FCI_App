import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fci_project/modules/fci_app/lecture_temp.dart';
import 'package:fci_project/modules/fci_app/pdfviewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../layout/fci_app/cubit/cubit.dart';
import '../../../layout/fci_app/cubit/states.dart';
import '../../../models/fci_app/lectures_model.dart';
import '../../../shared/components/components.dart';

class LecturesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<FciCubit, FciStates>(
      listener: (context, state) {
        if (state is FciSuccessLecturesDataState) {
          if (!state.lecturesModel.status) {
            showToast(
              text: state.lecturesModel.msg,
              state: ToastStates.ERROR,
            );
          }
        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: FciCubit.get(context).lecturesModel != null,
          builder: (context) => builderLecWidget(FciCubit.get(context).lecturesModel!,context),
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
Widget builderLecWidget(LecturesModel model, context) =>Scaffold(
    appBar: AppBar(
      title: Text(
        'Lectures',
      ),
    ),
    body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
              childAspectRatio: 1 / 1.1,
              children: List.generate(
                model.data.length,
                    (index) => buildGridLectures(model.data[index], context),
              ),
            ),
        ],
      ),
    ),
);

Widget buildGridLectures(Lectures lecture, context) => GestureDetector(
    child: MyLecture(
      lecname: lecture.name,
    ),
    onTap: () {
      navigateTo(context, pdfviewer());
    }
);
