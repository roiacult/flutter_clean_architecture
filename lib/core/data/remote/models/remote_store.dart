import 'package:clean_arch2/core/domain/models/store.dart';
import 'package:json_annotation/json_annotation.dart';

// This is necessary for the generator to work.
part 'remote_store.g.dart';

@JsonSerializable()
class RemoteStore {
  @JsonKey(name: "ids")
  String id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "owner")
  String owner;
  @JsonKey(name: "email")
  String email;
  @JsonKey(name: "image")
  String image;
  @JsonKey(name: "adrLat")
  double adrLat;
  @JsonKey(name: "adrLong")
  double adrLong;
  @JsonKey(name: "adrName")
  String adrName;
  @JsonKey(name: "number")
  String number;

  RemoteStore(this.id, this.name, this.owner, this.email, this.image,
      this.adrLat, this.adrLong, this.adrName, this.number);

  Store toStore() {
    return Store(
        id, name, owner, email, image, adrLat, adrLong, adrName, number);
  }

  factory RemoteStore.fromJson(Map<String, dynamic> json) =>
      _$RemoteStoreFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteStoreToJson(this);
}

extension storeExtentions on Store {
  RemoteStore toRemote() {
    return RemoteStore(
        id, name, owner, email, image, adrLat, adrLong, adrName, number);
  }
}
