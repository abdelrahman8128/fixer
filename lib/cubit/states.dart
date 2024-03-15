abstract class AppCubitStates{}


class AppInitialState extends AppCubitStates{}

class AppChangeBottomNavState extends AppCubitStates{}

class AppLoginLoadingState extends AppCubitStates{}

class AppLoginSuccessState extends AppCubitStates{}

class AppLoginErrorState extends AppCubitStates{
  final String error;
  AppLoginErrorState(this.error);
}

class AppForgetPasswordLoadingState extends AppCubitStates{}

class AppForgetPasswordSuccessState extends AppCubitStates{}

class AppForgetPasswordErrorState extends AppCubitStates{
  final String error;
  AppForgetPasswordErrorState(this.error);
}

class AppGetCarByNumberLoadingState extends AppCubitStates{}

class AppGetCarByNumberSuccessState extends AppCubitStates{}

class AppGetCarByNumberErrorState extends AppCubitStates{
  final String error;
  AppGetCarByNumberErrorState(this.error);
}