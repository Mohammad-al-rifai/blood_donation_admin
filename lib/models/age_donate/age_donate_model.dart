class AgeDonateModel {
  AgeDonateModel({
    required this.status,
    required this.youths,
    required this.elderly,
  });
  late final String status;
  late final  youths;
  late final  elderly;

  AgeDonateModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    youths = double.parse(json['youths'].toString());
    elderly = double.parse(json['elderly'].toString());
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['youths'] = youths;
    _data['elderly'] = elderly;
    return _data;
  }
}