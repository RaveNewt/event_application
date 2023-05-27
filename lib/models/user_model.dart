// class UserModel {
//   String? token;
//   UserModel? user;

//   UserModel({this.token, this.user});

//   UserModel.fromJson(Map<String, dynamic> json) {
//     token = json['token'];
//     user = UserModel.fromJson(json['result'] as Map<String, dynamic>);
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['token'] = token;
//     data['result'] = user!.toJson();
//     return data;
//   }
// }

class UserModel {
  String? token;
  String? id;
  String? username;
  String? email;
  String? password;
  String? role;
  String? createdAt;
  String? updatedAt;

  UserModel(
      {this.id,
      this.username,
      this.email,
      this.password,
      this.role,
      this.token,
      this.createdAt,
      this.updatedAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['data']['_id'];
    token = json['token'];
    username = json['data']['username'];
    email = json['data']['email'];
    password = json['data']['password'];
    role = json['data']['role'];
    createdAt = json['data']['createdAt'];
    updatedAt = json['data']['updatedAt'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    data['role'] = role;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }

  UserModel.copyWith({
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
