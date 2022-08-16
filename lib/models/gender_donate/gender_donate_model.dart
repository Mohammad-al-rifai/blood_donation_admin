class GenderDonateModel {
  GenderDonateModel({
    required this.status,
    required this.Male,
    required this.Famale,
  });
  late final String status;
  late final  Male;
  late final  Famale;

  GenderDonateModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    Male =  double.parse(json['Male'].toString());
    Famale =  double.parse(json['Famale'].toString());
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['Male'] = Male;
    _data['Famale'] = Famale;
    return _data;
  }
}