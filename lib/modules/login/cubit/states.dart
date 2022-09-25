abstract class LoginState {}
class LoginInitialState extends LoginState{}

class LoginSuccessState extends LoginState{
  final String uId;

  LoginSuccessState(this.uId);
}

class LoginLoadingState extends LoginState{}

class LoginErrorState extends LoginState{
  final String error;

  LoginErrorState(this.error);
}
class ChangePasswordVisibilityState extends LoginState{}
