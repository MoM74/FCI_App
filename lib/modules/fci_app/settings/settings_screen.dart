import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/drawer.dart';
import '../../../layout/fci_app/cubit/cubit.dart';
import '../../../layout/fci_app/cubit/states.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../change_password.dart';
import '../profile/profile_screenn.dart';
import '../welcome_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
var formKey = GlobalKey<FormState>();
  var fullnameController = TextEditingController();
  var usernameController = TextEditingController();
  var aboutController = TextEditingController();
  var date_of_birthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Update My Profile',
          style: TextStyle(fontSize: 17, fontStyle: FontStyle.normal),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.login_rounded),
            color: Colors.black,
            iconSize: 30,
            padding: EdgeInsets.only(right: 17),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return WelcomeScreen();
                  },
                ),
              );
            },
          )
        ],
      ),
      drawer: MyDrawer(prof: FciCubit.get(context).profileModel),
      body:Container(
        color:Colors.white,
        child: BlocConsumer<FciCubit, FciStates>(
          listener: (context, state) {
            if (state is FciSuccessUpdateUserState) {
                showToast(
                  text: 'Update done ',
                  state: ToastStates.SUCCESS,
                );}
            else if (state is FciErrorUpdateUserState) {
              showToast(
                text: 'Update done ',
                state: ToastStates.SUCCESS,
              );
            }
          },
          builder: (context, state) {
            var model = FciCubit.get(context).profileModel!;
            fullnameController.text = model.data.fullname;
            usernameController.text = model.data.username;
            aboutController.text = model.data.about;
            date_of_birthController.text = model.data.dateOfBirth;
            return ConditionalBuilder(
              condition: FciCubit.get(context).profileModel != null,
              builder: (context) {
                return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: SingleChildScrollView(

                        child: Column(
                          children:
                          [
                            if(state is FciLoadingUpdateUserState)
                              LinearProgressIndicator(),
                            SizedBox(
                              height: 20.0,
                            ),
                            defaultFormField(
                              controller: fullnameController,
                              type: TextInputType.name,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'name must not be empty';
                                }
                                return null;
                              },
                              label: 'Name',
                              prefix: Icons.person,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            defaultFormField(
                              controller: usernameController,
                              type: TextInputType.name,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'User Name must not be empty';
                                }

                                return null;
                              },
                              label: 'User Name',
                              prefix: Icons.person,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            defaultFormField(
                              controller: aboutController,
                              type: TextInputType.name,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'About must not be empty';
                                }
                                return null;
                              },
                              label: 'About',
                              prefix: Icons.article,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            defaultFormField(
                              controller: date_of_birthController,
                              type: TextInputType.datetime,
                              validate: (String value) {
                                if (value.isEmpty) {
                                  return 'Date Of Birth must not be empty';
                                }

                                return null;
                              },
                              label: 'Date Of Birth',
                              prefix: Icons.account_circle_sharp,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            defaultButton(
                              function: ()
                              {
                                if(formKey.currentState!.validate())
                                {
                                  FciCubit.get(context).updateUserData(
                                    fullname: fullnameController.text,
                                    username: usernameController.text ,
                                    about: aboutController.text,
                                    date_of_birth:date_of_birthController.text ,
                                  );
                                  if(model.status){
                                    FciCubit.get(context).getProfileData();
                                  }

                                }
                              },
                              text: 'update',
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            defaultButton(
                              function: () {
                                signOut(context);
                              },
                              text: 'Logout',
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Center(
                              child: GestureDetector(
                                child: const Text(
                                  "Change Password",
                                  style: TextStyle(
                                      color: Color(0xff4a1c40),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {

                                        return ChangePassword();
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                );
              },
              fallback: (context) => Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }
}


