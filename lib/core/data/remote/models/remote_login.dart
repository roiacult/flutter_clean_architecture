import 'package:json_annotation/json_annotation.dart';

// This is necessary for the generator to work.
part 'remote_login.g.dart';

@JsonSerializable()
class RemoteLogin {
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "password")
  String password;

  RemoteLogin(this.email, this.password);

  factory RemoteLogin.fromJson(Map<String, dynamic> json) =>
      _$RemoteLoginFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteLoginToJson(this);
}
