import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fci_project/models/fci_app/login_model.dart';
import 'package:fci_project/modules/fci_app/login/cubit/cubit.dart';
import 'package:fci_project/modules/fci_app/login/cubit/states.dart';
import 'package:fci_project/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../layout/fci_app/fci_layout.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/network/local/cache_helper.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {

   return BlocProvider(
      create: (BuildContext context) => FciLoginCubit(),
      child: BlocConsumer<FciLoginCubit, FciLoginStates>(
        listener: (context, state) {
          if (state is FciLoginSuccessState)
          {
            if (state.loginModel.status)
            {
              print(state.loginModel.token);
              CacheHelper.saveData(
                key: 'token',
                value: state.loginModel.token,
              ).then((value)
              {
                token = state.loginModel.token;
                navigateAndFinish(context, FciLayout(),);
              });
            }
          }
          else if(state is FciLoginErrorState){
                      showToast(
                        text:'Please enter a valid email or password',
                        state: ToastStates.ERROR,
                      );
                    }

              },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: Theme.of(context).textTheme.headline4?.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                          controller: usernameController,
                          type: TextInputType.emailAddress,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'please enter your email address';
                            }
                          },
                          label: 'Email Address',
                          prefix: Icons.email_outlined,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          suffix: FciLoginCubit.get(context).suffix,
                          onSubmit: (value) {
                            if (formKey.currentState!.validate()) {
                              FciLoginCubit.get(context).userLogin(
                                username: usernameController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          isPassword: FciLoginCubit.get(context).isPassword,
                          suffixPressed: () {
                            FciLoginCubit.get(context)
                                .changePasswordVisibility();
                          },
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'password is too short';
                            }
                          },
                          label: 'Password',
                          prefix: Icons.lock_outline,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! FciLoginLoadingState,
                          builder: (context) => defaultButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                FciLoginCubit.get(context).userLogin(
                                  username: usernameController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            text: 'Login',
                            isUpperCase: true,
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
