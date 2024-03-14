import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fixer_app/cubit/states.dart';
import 'package:fixer_app/models/Forget_password_model.dart';
import 'package:fixer_app/models/login_by_code_model.dart';
import 'package:fixer_app/shared/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:http/http.dart';
import 'package:http/http.dart';

import '../models/get_car_by_number_model.dart';
import '../network/end_points.dart';
import '../network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppCubitStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  LoginByCodeModel? loginByCodeModel;
  ForgetPasswordModel? forgetPasswordModel;
  GetCarByNumberModel? getCarByNumberModel;

  void loginByCode({
    required String carCode,
    required password,
  }) {
    emit(AppLoginLoadingState());

    DioHelper.postDate(
      url: LOGIN,
      data: {
        'carCode': int.parse(carCode),
        'password': password,
      },
    ).then((value) {
      loginByCodeModel = LoginByCodeModel.fromJson(value.data);
      print('done');
      //print(value.data);
      print(loginByCodeModel?.token);
      emit(AppLoginSuccessState());

    }).catchError((error) {
      emit(AppLoginErrorState(error.toString()));
    });
  }

  void forgotPassword({
    required String carCode,
    required String carNumber,
  }) {
    emit(AppForgetPasswordLoadingState());

    const url =
        'https://fixer-backend-1.onrender.com/api/V1/auth/forgotPassword';
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'carCode': int.parse(carCode),
      'carNumber': carNumber,
    });

    post(Uri.parse(url), headers: headers, body: body).then((response) {
      forgetPasswordModel =
          ForgetPasswordModel.fromJson(jsonDecode(response.body));

      if (forgetPasswordModel!.status != 'fail') {
        emit(AppForgetPasswordSuccessState());
        showToast('password sent to your email');
      } else {
        emit(AppForgetPasswordErrorState(forgetPasswordModel?.message ?? ''));
      }
    });
  }

  void getCarByNumber({
    required String carNumber,
  }) {
    print(carNumber);
    String url =
        'https://fixer-backend-1.onrender.com/api/V1/auth/Garage/'+carNumber;
    print (url);
    final headers = {'Content-Type': 'application/json'};
    read(
      Uri.parse(url),
      headers: headers,
    ).then((response) {
      getCarByNumberModel =
          GetCarByNumberModel.fromJson(jsonDecode(response));

      if (getCarByNumberModel?.color != 'fail') {
        showToast('password seeeeeeeeeeeeeeeeent to your email');
      }
    });
  }
}
