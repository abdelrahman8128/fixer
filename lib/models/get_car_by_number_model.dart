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
  List<dynamic>?componentState;


  GetCarByNumberModel.fromJson(Map<String,dynamic>json)
  {
    json=json['data'];
    id=json['_id'];
    ownerName=json['ownerName'];
    carNumber=json['carNumber'];
    phoneNumber=json['phoneNumber'];
    email=json['email'];
    carIdNumber=json['carIdNumber'];
    color=json['color'];
    state=json['state'];
    brand=json['brand'];
    category=json['category'];
    model=json['model'];
    generatedCode=json['generatedCode'];
    generatedPassword=json['generatedPassword'];
    periodicRepairs=json['periodicRepairs'];
    nonPeriodicRepairs=json['nonPeriodicRepairs'];
    repairing=json['repairing'];
    List<dynamic>?componentState=json['componentState'];




  }

}