import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required String productId,
    required String productName,
    required double costPrice,
    required double sellingPrice,
    String? imageUrl,
    required int availableQty,
    @Default(1) int orderQty,
    @Default(1) int safetyStock,
    required DateTime? dateAdded,
    required DateTime? dateModified,
    required DateTime? expiryDate,
  }) = _Product;

  factory Product.fromJson(Map<String, Object?> json) =>
      _$ProductFromJson(json);
}
