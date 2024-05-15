// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      productId: json['product_id'] as String,
      productName: json['product_name'] as String,
      costPrice: (json['cost_price'] as num).toInt(),
      sellingPrice: (json['selling_price'] as num).toInt(),
      imageUrl: json['image_url'] as String?,
      availableQty: (json['stock_qty'] as num).toInt(),
      orderQty: (json['order_qty'] as num?)?.toInt() ?? 1,
      safetyStock: (json['safety_stock'] as num?)?.toInt() ?? 1,
      dateAdded: const DateTimeToIsoConverter()
          .fromJson(json['created_at'] as String?),
      dateModified: const DateTimeToIsoConverter()
          .fromJson(json['modified_at'] as String?),
      expiryDate: const DateTimeToIsoConverter()
          .fromJson(json['expiry_date'] as String?),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'product_name': instance.productName,
      'cost_price': instance.costPrice,
      'selling_price': instance.sellingPrice,
      'image_url': instance.imageUrl,
      'stock_qty': instance.availableQty,
      'order_qty': instance.orderQty,
      'safety_stock': instance.safetyStock,
      'created_at': const DateTimeToIsoConverter().toJson(instance.dateAdded),
      'modified_at':
          const DateTimeToIsoConverter().toJson(instance.dateModified),
      'expiry_date': const DateTimeToIsoConverter().toJson(instance.expiryDate),
    };
