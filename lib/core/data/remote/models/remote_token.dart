import 'package:json_annotation/json_annotation.dart';

// This is necessary for the generator to work.
part 'remote_token.g.dart';

@JsonSerializable()
class RemoteToken {
  @JsonKey(name: "key")
  final String key;

  RemoteToken(this.key);

  factory RemoteToken.fromJson(Map<String, dynamic> json) =>
      _$RemoteTokenFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteTokenToJson(this);
}
