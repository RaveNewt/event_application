class LoginFormModel {
  String? email;
  String? password;

  LoginFormModel({
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  LoginFormModel copyWith({
    String? email,
    String? password,
  }) =>
      LoginFormModel(
        email: email ?? this.email,
        password: password ?? this.password,
      );
}
