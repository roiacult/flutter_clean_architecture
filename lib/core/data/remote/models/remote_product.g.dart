// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteProductPage _$RemoteProductPageFromJson(Map<String, dynamic> json) {
  return RemoteProductPage(
    json['count'] as int,
    json['next'] as String?,
    json['previous'] as String?,
    (json['results'] as List<dynamic>)
        .map((e) => RemoteProduct.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$RemoteProductPageToJson(RemoteProductPage instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

RemoteProduct _$RemoteProductFromJson(Map<String, dynamic> json) {
  return RemoteProduct(
    json['idp'] as String,
    RemoteStore.fromJson(json['store'] as Map<String, dynamic>),
    json['desc'] as String,
    json['idc'] as String,
    json['idsc'] as String,
    json['name'] as String,
    json['nbLikes'] as int,
    (json['price'] as num).toDouble(),
    json['image'] as String?,
    json['unity'] as String,
    json['max'] as int,
    json['min'] as int,
    json['like'] as bool,
    json['codeBar'] as String,
    (json['promo'] as num).toDouble(),
    json['availability'] as bool,
  );
}

Map<String, dynamic> _$RemoteProductToJson(RemoteProduct instance) =>
    <String, dynamic>{
      'idp': instance.id,
      'store': instance.store,
      'desc': instance.desc,
      'idc': instance.idc,
      'idsc': instance.idsc,
      'name': instance.name,
      'nbLikes': instance.nbLikes,
      'price': instance.price,
      'image': instance.image,
      'unity': instance.unity,
      'max': instance.max,
      'min': instance.min,
      'like': instance.like,
      'codeBar': instance.codeBar,
      'promo': instance.promo,
      'availability': instance.availability,
    };
