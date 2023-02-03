import 'package:fci_project/models/fci_app/login_model.dart';
import 'package:fci_project/modules/fci_app/login/cubit/states.dart';
import 'package:fci_project/shared/network/end_points.dart';
import 'package:fci_project/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class FciLoginCubit extends Cubit<FciLoginStates> {
    FciLoginCubit() : super(FciLoginInitialState());

  static FciLoginCubit get(context) => BlocProvider.of(context);

   FciLoginModel? loginModel;

  void userLogin({
    required String username,
    required String password,
  })
  {
    emit(FciLoginLoadingState());

    DioHelper.postData(
      url: LOGIN,
      data:
      {
        'username': username,
        'password': password,
      },
    ).then((value)
    {
      print(value.data);
       loginModel = FciLoginModel.fromJson(value.data);
      emit(FciLoginSuccessState(loginModel!));
    }).catchError((error)
    {
      print(error.toString());
      emit(FciLoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(fciChangePasswordVisibilityState());
  }
}
