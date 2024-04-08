import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:login/models/saleso_mdel.dart'; 

import 'package:login/modules/login/cubit/states.dart';
import 'package:login/shared/network/remote/dio_helper.dart';


class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;
  IconData iconData = Icons.remove_red_eye;
  void passwordVisibility() {
    isPassword = !isPassword;
    iconData = isPassword
        ? iconData = Icons.remove_red_eye
        : Icons.visibility_off_outlined;
    emit(LoginPasswordIsVisibilityState());
  }

  SalesModel? loginModel;

  List<SalesModel> salesList = [];

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLodingState());
    DioHelper.postData(url: 'Webservice/Get_SOMOBILEAPP_SalesOrder', data: {
      "BRANCH": email,
      "PERSONNELNUMBER": password,
    }).then((value) {
      print(value.data);
      salesList.clear();
      value.data.forEach((key, jsonData) {
        if (key != "status") {
          salesList.add(SalesModel.fromJson(jsonData));
        }
      });
        print(salesList.length);
     
      emit(LoginSuccessState(salesList));
    }).catchError((error) {
     
    });
  }
}
