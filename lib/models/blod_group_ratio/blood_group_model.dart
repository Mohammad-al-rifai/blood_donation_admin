class BloodGroupRatioModel {
  BloodGroupRatioModel({
    required this.status,
    required this.A_plus,
    required this.B_plus,
    required this.AB_plus,
    required this.O_plus,
    required this.A_minus,
    required this.B_minus,
    required this.AB_minus,
    required this.O_minus,
    required this.Blasma,
  });
  late final String status;
  late final  A_plus;
  late final  B_plus;
  late final  AB_plus;
  late final  O_plus;
  late final  A_minus;
  late final  B_minus;
  late final  AB_minus;
  late final  O_minus;
  late final  Blasma;

  BloodGroupRatioModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    A_plus = double.parse(json['A+'].toString());
    B_plus = double.parse(json['B+'].toString());;
    AB_plus = double.parse(json['AB+'].toString());;
    O_plus = double.parse(json['O+'].toString());
    A_minus = double.parse(json['A-'].toString());
    B_minus = double.parse(json['B-'].toString());
    AB_minus = double.parse(json['AB-'].toString());
    O_minus = double.parse(json['O-'].toString());
    Blasma = double.parse(json['Blasma'].toString());
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['A+'] = A_plus;
    _data['B+'] = B_plus;
    _data['AB+'] = AB_plus;
    _data['O+'] = O_plus;
    _data['A-'] = A_minus;
    _data['B-'] = B_minus;
    _data['AB-'] = AB_minus;
    _data['O-'] = O_minus;
    _data['Blasma'] = Blasma;
    return _data;
  }
}