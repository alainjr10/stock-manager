import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_model.freezed.dart';
// part 'product_model.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required String productId,
    required String productName,
    required double costPrice,
    required double sellingPrice,
    String? imageUrl,
    required int quantity,
    @Default(1) int safetyStock,
    required DateTime? dateAdded,
    required DateTime? dateModified,
  }) = _Product;

  // factory Product.fromJson(Map<String, dynamic> json) {
  //   return _$ProductFromJson(json);
  // }
}
