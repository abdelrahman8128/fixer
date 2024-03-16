import 'package:fixer_app/screens/login/login.dart';

class LoginByCodeModel{
String? token;
LoginByCodeDataModel? userData;
GetCarByNumberModel? carData;
LoginByCodeModel.fromJson(Map<String,dynamic>json)

{
  token=json['token'];
  userData=LoginByCodeDataModel.fromJson(json['data']['user']);
  carData=GetCarByNumberModel.fromJson(json['data']['car']);
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
  String? carNumber=null;
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
class GetCarByNumberModel{

  String? id;
  String? ownerName;
  String? carNumber;
  int? phoneNumber;
  String? email;
  String? carIdNumber;
  String? color;
  String? state;
  String? brand;
  String? category;
  String? model;
  String? generatedCode;
  String? generatedPassword;
  int? periodicRepairs;
  int? nonPeriodicRepairs;
  bool? repairing;
  int? distance;
  String?motorNumber;
  List<dynamic>?componentState;
  DateTime?nextRepairDate;
  DateTime?lastRepairDate;

  GetCarByNumberModel.fromJson(Map<String,dynamic>json)
  {
    state=json['State'];
    id=json['_id'];
    ownerName=json['ownerName'];
    carNumber=json['carNumber'];
    phoneNumber=json['phoneNumber'];
    email=json['email'];
    carIdNumber=json['carIdNumber'];
    color=json['color'];
    brand=json['brand'];
    category=json['category'];
    model=json['model'];
    generatedCode=json['generatedCode'];
    generatedPassword=json['generatedPassword'];
    periodicRepairs=json['periodicRepairs'];
    nonPeriodicRepairs=json['nonPeriodicRepairs'];
    repairing=json['repairing'];
    componentState=json['componentState'];
    motorNumber=json['motorNumber'];
    nextRepairDate=DateTime.parse(json['nextRepairDate']);
    lastRepairDate=DateTime.parse(json['lastRepairDate']);




  }

}
