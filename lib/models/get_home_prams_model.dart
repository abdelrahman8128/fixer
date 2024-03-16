class GetHomePramsModel{
  DateTime? createdDate ;
  DateTime? expectedDate ;
  double? completedServicesRatio;
  String? state;
  DateTime? lastRepairDate;
  DateTime?nextRepairDate;
  int? periodicRepairs;
  int ?nonPeriodicRepairs;
  GetHomePramsModel.fromJson(Map <String,dynamic>json)
  {
    json=json['data'];
    createdDate=DateTime.parse(json['createdDate']);
    expectedDate=DateTime.parse(json['expectedDate']);
    completedServicesRatio=json['completedServicesRatio'];
    state=json['state'];
    lastRepairDate=DateTime.parse(json['lastRepairDate']);
    nextRepairDate=DateTime.parse(json['nextRepairDate']);
    periodicRepairs=json['periodicRepairs'];
    nonPeriodicRepairs=json['nonperiodicRepairs'];
  }
}