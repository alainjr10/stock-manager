// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'cost_price') required int costPrice,
    @JsonKey(name: 'selling_price') required int sellingPrice,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'stock_qty') required int availableQty,
    @JsonKey(name: 'order_qty') @Default(1) int orderQty,
    @JsonKey(name: 'safety_stock') @Default(1) int safetyStock,
    @JsonKey(name: 'created_at')
    @DateTimeToIsoConverter()
    required DateTime? dateAdded,
    @JsonKey(name: 'modified_at')
    @DateTimeToIsoConverter()
    required DateTime? dateModified,
    @JsonKey(name: 'expiry_date')
    @DateTimeToIsoConverter()
    required DateTime? expiryDate,
  }) = _Product;

  factory Product.fromJson(Map<String, Object?> json) =>
      _$ProductFromJson(json);
}

// datetime to isostring converter
class DateTimeToIsoConverter implements JsonConverter<DateTime?, String?> {
  const DateTimeToIsoConverter();

  @override
  DateTime? fromJson(String? json) {
    return json == null ? null : DateTime.parse(json);
  }

  @override
  String? toJson(DateTime? object) {
    return object?.toIso8601String();
  }
}
