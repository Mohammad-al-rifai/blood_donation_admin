class LocationPostModel {
  LocationPostModel({
    required this.status,
    required this.message,
    required this.data,
  });
  late final String status;
  late final String message;
  late final List<Data> data;

  LocationPostModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.positionId,
    required this.positionLat,
    required this.positionLang,
    required this.createdAt,
    required this.updatedAt,
  });
  late final  positionId;
  late final  positionLat;
  late final  positionLang;
  late final  createdAt;
  late final  updatedAt;

  Data.fromJson(Map<String, dynamic> json){
    positionId = json['position_id'];
    positionLat = json['position_Lat'];
    positionLang = json['position_Lang'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['position_id'] = positionId;
    _data['position_Lat'] = positionLat;
    _data['position_Lang'] = positionLang;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}