import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_manager/src/features/inventory/domain/inventory_models.dart';
import 'package:stock_manager/src/utils/extensions/extensions.dart';

class LocalInventoryData {
  Future<List<Product>> getInventoryProducts() async {
    await Future.delayed(const Duration(milliseconds: 2500));
    // return Future.error("error");
    return availableInventory;
  }

  Future<Product> getProductById(String productId) async {
    await Future.delayed(const Duration(milliseconds: 2500));
    return availableInventory
        .firstWhere((element) => element.productId == productId);
  }

  Future<void> addProductSale(List<Product> product) async {
    await Future.delayed(const Duration(milliseconds: 2500));
    for (var element in product) {
      final index = availableInventory
          .indexWhere((item) => item.productId == element.productId);
      availableInventory[index] = element.copyWith(
        availableQty: availableInventory[index].availableQty - element.orderQty,
      );
      productSales.add(element);
      'upd item ${availableInventory[index].toString()}, and length of sales list ${productSales.length}'
          .log();
    }
  }

  Future<void> updateProductSale(Product product) async {
    await Future.delayed(const Duration(milliseconds: 2500));
    final index = availableInventory
        .indexWhere((element) => element.productId == product.productId);
    availableInventory[index] = product;
  }

  Future<void> deleteProductSale(String productId) async {
    await Future.delayed(const Duration(milliseconds: 2500));
    availableInventory.removeWhere((element) => element.productId == productId);
  }
}

final localInventoryProvider = Provider((ref) => LocalInventoryData());
List<Product> productSales = [];
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
