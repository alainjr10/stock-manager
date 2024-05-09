// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      productId: json['productId'] as String,
      productName: json['productName'] as String,
      costPrice: (json['costPrice'] as num).toDouble(),
      sellingPrice: (json['sellingPrice'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String?,
      availableQty: (json['availableQty'] as num).toInt(),
      orderQty: (json['orderQty'] as num?)?.toInt() ?? 1,
      safetyStock: (json['safetyStock'] as num?)?.toInt() ?? 1,
      dateAdded: json['dateAdded'] == null
          ? null
          : DateTime.parse(json['dateAdded'] as String),
      dateModified: json['dateModified'] == null
          ? null
          : DateTime.parse(json['dateModified'] as String),
      expiryDate: json['expiryDate'] == null
          ? null
          : DateTime.parse(json['expiryDate'] as String),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productName': instance.productName,
      'costPrice': instance.costPrice,
      'sellingPrice': instance.sellingPrice,
      'imageUrl': instance.imageUrl,
      'availableQty': instance.availableQty,
      'orderQty': instance.orderQty,
      'safetyStock': instance.safetyStock,
      'dateAdded': instance.dateAdded?.toIso8601String(),
      'dateModified': instance.dateModified?.toIso8601String(),
      'expiryDate': instance.expiryDate?.toIso8601String(),
    };
