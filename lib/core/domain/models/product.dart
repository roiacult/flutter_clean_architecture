import 'package:clean_arch2/core/domain/models/store.dart';

class Product {
  String id;
  Store store;
  String desc;
  String idc;
  String idsc;
  String name;
  int nbLikes;
  double price;
  String? image;
  String unity;
  int max;
  int min;
  bool like;
  String codeBar;
  double promo;
  bool availability;

  Product(
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
}
