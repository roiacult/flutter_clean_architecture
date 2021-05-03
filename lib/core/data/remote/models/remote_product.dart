import 'package:clean_arch2/core/data/remote/models/remote_store.dart';
import 'package:clean_arch2/core/domain/models/product.dart';
import 'package:json_annotation/json_annotation.dart';

// This is necessary for the generator to work.
part 'remote_product.g.dart';

@JsonSerializable()
class RemoteProductPage {
  @JsonKey(name: "count")
  int count;
  @JsonKey(name: "next")
  String? next;
  @JsonKey(name: "previous")
  String? previous;
  @JsonKey(name: "results")
  List<RemoteProduct> results;

  RemoteProductPage(this.count, this.next, this.previous, this.results);

  factory RemoteProductPage.fromJson(Map<String, dynamic> json) =>
      _$RemoteProductPageFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteProductPageToJson(this);
}

@JsonSerializable()
class RemoteProduct {
  @JsonKey(name: "idp")
  String id;
  @JsonKey(name: "store")
  RemoteStore store;
  @JsonKey(name: "desc")
  String desc;
  @JsonKey(name: "idc")
  String idc;
  @JsonKey(name: "idsc")
  String idsc;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "nbLikes")
  int nbLikes;
  @JsonKey(name: "price")
  double price;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "unity")
  String unity;
  @JsonKey(name: "max")
  int max;
  @JsonKey(name: "min")
  int min;
  @JsonKey(name: "like")
  bool like;
  @JsonKey(name: "codeBar")
  String codeBar;
  @JsonKey(name: "promo")
  double promo;
  @JsonKey(name: "availability")
  bool availability;

  RemoteProduct(
      this.id,
      this.store,
      this.desc,
      this.idc,
      this.idsc,
      this.name,
      this.nbLikes,
      this.price,
      this.image,
      this.unity,
      this.max,
      this.min,
      this.like,
      this.codeBar,
      this.promo,
      this.availability);

  Product toProduct() {
    return Product(id, store.toStore(), desc, idc, idsc, name, nbLikes, price,
        image, unity, max, min, like, codeBar, promo, availability);
  }

  factory RemoteProduct.fromJson(Map<String, dynamic> json) =>
      _$RemoteProductFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteProductToJson(this);
}

extension storeExtentions on Product {
  RemoteProduct toRemote() {
    return RemoteProduct(id, store.toRemote(), desc, idc, idsc, name, nbLikes,
        price, image, unity, max, min, like, codeBar, promo, availability);
  }
}
