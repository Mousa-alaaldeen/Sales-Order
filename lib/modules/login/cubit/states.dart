import 'package:login/models/Login_model.dart';
import 'package:login/models/saleso_mdel.dart';



abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLodingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final   List<SalesModel> salesList;
  LoginSuccessState(this.salesList);
}

class LoginErrorState extends LoginState {
  final LoginModel error;
  LoginErrorState(this.error);
}

class LoginPasswordIsVisibilityState extends LoginState {}



