import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_manager/src/features/inventory/domain/product_model.dart';

class LocalInventoryData {
  Future<List<Product>> getInventoryProducts() async {
    await Future.delayed(const Duration(milliseconds: 2500));
    // return Future.error("error");
    return availableInventory;
  }
}

final localInventoryProvider = Provider((ref) => LocalInventoryData());

List<Product> availableInventory = [
  Product(
    productId: "1",
    productName: "Milk",
    costPrice: 2500,
    sellingPrice: 3200,
    availableQty: 50,
    dateAdded: DateTime.now(),
    dateModified: DateTime.now(),
    expiryDate: DateTime(2028, 9, 12),
  ),
  Product(
    productId: "2",
    productName: "Office Table",
    costPrice: 60000,
    sellingPrice: 75000,
    availableQty: 27,
    dateAdded: DateTime.now(),
    dateModified: DateTime.now(),
    expiryDate: DateTime(2029, 2, 04),
  ),
  Product(
    productId: "3",
    productName: "22\" Bezeless Dell monitor",
    costPrice: 33000,
    sellingPrice: 45000,
    availableQty: 40,
    dateAdded: DateTime.now(),
    dateModified: DateTime.now(),
    expiryDate: DateTime(2025, 05, 28),
  ),
];
