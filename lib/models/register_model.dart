class RegisterFormModel {
  String? username;
  String? email;
  String? password;

  RegisterFormModel({
    this.username,
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
    };
  }

  RegisterFormModel copyWith({
    String? username,
    String? email,
    String? password,
  }) =>
      RegisterFormModel(
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
      );
}
