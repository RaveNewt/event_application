class UserModel {
  String? token;
  UserData? user;

  UserModel({this.token, this.user});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = UserData.fromJson(json['result'] as Map<String, dynamic>);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['result'] = user!.toJson();
    return data;
  }
}

class UserData {
  String? id;
  String? username;
  String? email;
  String? password;
  String? role;
  String? createdAt;
  String? updatedAt;

  UserData(
      {this.id,
      this.username,
      this.email,
      this.password,
      this.role,
      this.createdAt,
      this.updatedAt});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    role = json['role'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    data['role'] = role;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }

  UserData.copyWith({
    String? username,
    String? email,
    String? password,
  }) {
    id = id;
    username = username ?? this.username;
    email = email ?? this.email;
    password = password ?? this.password;
    role = role ?? this.role;
    createdAt = createdAt;
    updatedAt = updatedAt;
  }
}
