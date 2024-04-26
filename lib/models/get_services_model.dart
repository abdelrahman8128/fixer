import 'dart:core';

class GetServicesModel {
  GetServicesModel();
  List<Visit>visits=[];
  GetServicesModel.fromJson(Map<String,dynamic>?json)
  {
    json?['data'].forEach((element){
      visits.add(Visit.fromJson(element));
    });
  }

}
class Visit{
  Visit();
  String ? id;
  int ?discount;
  String? carNumber;
  String?type;
  DateTime?expectedDate;
  List<Service> services=[];
  List<Addition> additions=[];
  List<Component> components=[];
  int? priceAfterDiscount;
  bool?complete;
  double?completedServicesRatio;
  String? state;
  DateTime?createdAt;
  DateTime?updatedAt;

  Visit.fromJson(Map<String,dynamic>?json)
  {
   id=json?['_id'];
   discount=json?['discount'];
   carNumber=json?['carNumber'];
   type=json?['type'];
   expectedDate=DateTime.parse(json?['expectedDate']);
   json?['Services'].forEach((element){
     services.add(Service.fromJson(element));
   });
   json?['additions'].forEach((element){
     additions.add(Addition.fromJson(element));
   });
   json?['component'].forEach((element){
     components.add(Component.fromJson(element));
   });
   priceAfterDiscount=json?['priceAfterDiscount'];
   complete=json?['complete'];
   if (json?['completedServicesRatio']!=null) {
     completedServicesRatio=double.parse(json!['completedServicesRatio'].toString());
   }
   state=json?['State'];
   createdAt=DateTime.parse(json?['createdAt']);
   updatedAt=DateTime.parse(json?['updatedAt']);

  }

}
class Service{
  Service();
  String?state;
  String?name;
  int ?price;
  String?id;
  Service.fromJson(Map<String,dynamic>?json)
  {
    state=json?['state'];
    name=json?['name'];
    price=json?['price'];
    id=json?['_id'];
  }
}
class Addition{
  Addition();
  String?name;
  int?price;
  String?id;
  Addition.fromJson(Map<String,dynamic>json)
  {
    name=json['name'];
    price=json['price'];
    id=json['_id'];
  }
}
class Component{
  Component();
  String?name;
  int?quantity;
  int?price;
  String?id;
  Component.fromJson(Map<String,dynamic>json)
  {
    name=json['name'];
    price=json['price'];
    id=json['_id'];
    quantity=json['quantity'];
  }

}