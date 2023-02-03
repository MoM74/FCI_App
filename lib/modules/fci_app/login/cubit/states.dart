
import 'package:fci_project/models/fci_app/login_model.dart';

abstract class FciLoginStates {}

class FciLoginInitialState extends FciLoginStates {}

class FciLoginLoadingState extends FciLoginStates {}

class FciLoginSuccessState extends FciLoginStates
{
  final FciLoginModel loginModel;

  FciLoginSuccessState(this.loginModel);
}

class FciLoginErrorState extends FciLoginStates
{
  final String error;

  FciLoginErrorState(this.error);
}

class fciChangePasswordVisibilityState extends FciLoginStates {}
