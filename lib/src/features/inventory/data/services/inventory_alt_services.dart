import 'package:stock_manager/src/features/inventory/domain/inventory_models.dart';

class InventoryAltServices {
  // 0 for in stock, 1 for out of stock, 2 for low stock,
  static (String, int) productStatusProvider({required Product product}) {
    (String, int) status;
    int safetyStock = product.safetyStock;
    switch (product.availableQty) {
      case int n when n > safetyStock:
        status = ("In Stock", 0);
        break;
      case int n when n < 1:
        status = ("Out of Stock", 1);
        break;
      case int n when n <= safetyStock:
        status = ("Low Stock", 2);
        break;
      default:
        status = ("In Stock", 0);
        break;
    }
    return status;
  }
}
