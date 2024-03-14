import 'package:fixer_app/screens/login/login.dart';

class LoginByCodeModel{
String? token;
LoginByCodeDataModel? data;
LoginByCodeModel.fromJson(Map<String,dynamic>json)
{
  token=json['token'];
  data=LoginByCodeDataModel.fromJson(json['data']);
}


}

class LoginByCodeDataModel{

  String? id;
  String? name;
  String? email;
  String? role;
  bool? active;
  String? Car;
  String? carCode;
  String? carNumber;
  String? createdAt;
  String? updatedAt;
  LoginByCodeDataModel.fromJson(Map<String,dynamic>json)
  {
    id=json['_id'];
    name=json['name'];
    email=json['email'];
    role=json['role'];
    active=json['active'];
    Car=json['Car'];
    carCode=json['carCode'];
    carNumber=json['carNumber'];
    createdAt=json['createdAt'];
    updatedAt=json['updatedAt'];

  }

}
