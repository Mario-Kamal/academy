
import 'package:academy/modules/login/cubit/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  // LoginModel loginModel;

  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);



  Widget suffix = Image.asset('assets/images/13.png');
  bool isPassword = false;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icon(Icons.visibility_off) : Image.asset('assets/images/13.png');
    emit(ChangePasswordVisibilityState());
  }
}
