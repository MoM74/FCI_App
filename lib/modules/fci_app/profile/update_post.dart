
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../layout/fci_app/cubit/cubit.dart';
import '../../../layout/fci_app/cubit/states.dart';
import '../../../models/fci_app/profile_model.dart';
import '../../../shared/components/components.dart';

class UpdatePost extends StatelessWidget {
  final int id ;
   UpdatePost({Key? key, required this.id}) : super(key: key);

  var formKey = GlobalKey<FormState>();
  var bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(id);
    return Scaffold(
        appBar: AppBar(
        title: Text(
            'Update My Post',
            style: TextStyle(fontSize: 17, fontStyle: FontStyle.normal),
          ),
        elevation: 0,),
        body:Container(
        color:Colors.white,
        child: BlocConsumer<FciCubit, FciStates>(
              listener: (context, state) {
                if (state is FciSuccessPutUserPostState) {
                  showToast(
                    text: 'Update done ',
                    state: ToastStates.SUCCESS,
                  );}
                else if (state is FciErrorPutUserPostState) {
                  showToast(
                    text: 'Update done ',
                    state: ToastStates.SUCCESS,
                  );
                }
              },
              builder: (context, state) {

                 var model = FciCubit.get(context).profileModel!;
                 bodyController.text = model.data.userPosts[id].body;
                return ConditionalBuilder(
                  condition: FciCubit.get(context).profileModel != null,
                  builder: (context) => SingleChildScrollView(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children:
                            [
                              if(state is FciLoadingPutUserPostState)
                                LinearProgressIndicator(),
                              SizedBox(
                                height: 20.0,
                              ),
                              defaultFormField(
                                controller: bodyController,
                                type: TextInputType.text,
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return 'Body must not be empty';
                                  }

                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              defaultButton(
                                function: ()
                                {
                                  if(formKey.currentState!.validate())
                                  {
                                    FciCubit.get(context).updateUserPost(
                                      body:bodyController.text,
                                      id: model.data.userPosts[id].id,
                                    );
                                    if(model.status){
                                      FciCubit.get(context).getProfileData();
                                      
                                    }
                                  }
                                },
                                text: 'update',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  fallback: (context) => Center(child: CircularProgressIndicator()),
                );
              },
            ),
    ),
    );
  }
}

