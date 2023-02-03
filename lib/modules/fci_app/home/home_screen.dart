
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fci_project/models/fci_app/home_model.dart';
import 'package:fci_project/modules/fci_app/lectures/lectures_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../components/temp_folder.dart';
import '../../../layout/fci_app/cubit/cubit.dart';
import '../../../layout/fci_app/cubit/states.dart';
import '../../../models/fci_app/home_model.dart';
import '../../../shared/components/components.dart';
import '../lecture_folders.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<FciCubit, FciStates>(
      listener: (context, state) {
        if (state is FciSuccessHomeDataState) {
          if (!state.homeModel.status) {
            showToast(
              text: state.homeModel.msg,
              state: ToastStates.ERROR,
            );
          }
        }
                     },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: FciCubit.get(context).homeModel != null,
          builder: (context) => builderWidget(FciCubit.get(context).homeModel!,context),
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
Widget builderWidget(HomeModel model, context) =>
    SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [

                 Text('Department : ',
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 20),
                ),
                 Text(
                   model.data.depName,
                        style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 20),
                      ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
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
        ],
      ),
    );

Widget buildGridProduct(Subject subject, context) =>
    GestureDetector(
      child: MyFolder(
        mytext: subject.name,
        hinttext: subject.doctor,
        ),
        onTap: () {
        FciCubit.get(context).getLecturesData(id:subject.pk);
        navigateTo(context, LecturesScreen());
        }
);
