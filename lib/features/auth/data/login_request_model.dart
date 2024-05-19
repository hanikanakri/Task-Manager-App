import '/core/api/core_models/base_result_model.dart';

class LoginRequestModel extends BaseResultModel {
  String? username;
  String? password;
  int? expiresInMins;

  LoginRequestModel({
    this.username,
    this.password,
    this.expiresInMins = 60,
  });

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      LoginRequestModel(
        username: json["username"],
        password: json["password"],
        expiresInMins: json["expiresInMins"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "expiresInMins": expiresInMins,
      };
}
