class GetAllTokensModel {
  GetAllTokensModel({
    required this.message,
    required this.status,
    required this.users,
  });
  late final String message;
  late final String status;
  late final List<Users> users;

  GetAllTokensModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
    status = json['status'];
    users = List.from(json['users']).map((e)=>Users.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['status'] = status;
    _data['users'] = users.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Users {
  Users({
    required this.userId,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.address,
    required this.isAdmin,
    required this.tokenPh,
    required this.birthDate,
    required this.createdAt,
    required this.updatedAt,
  });
  late final  userId;
  late final  name;
  late final  email;
  late final  password;
  late final  phone;
  late final  address;
  late final  isAdmin;
  late final  tokenPh;
  late final  birthDate;
  late final  createdAt;
  late final  updatedAt;

  Users.fromJson(Map<String, dynamic> json){
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    address = json['address'];
    isAdmin = json['isAdmin'];
    tokenPh = json['tokenPh'];
    birthDate = json['birthDate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_id'] = userId;
    _data['name'] = name;
    _data['email'] = email;
    _data['password'] = password;
    _data['phone'] = phone;
    _data['address'] = address;
    _data['isAdmin'] = isAdmin;
    _data['tokenPh'] = tokenPh;
    _data['birthDate'] = birthDate;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}