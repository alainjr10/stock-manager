import 'package:stock_manager/src/features/inventory/domain/inventory_models.dart';

class InventoryAltServices {
  // 0 for in stock, 1 for out of stock, 2 for low stock,
  static (String, int) productStatusProvider({required Product product}) {
    (String, int) status;
    status = switch (product.availableQty) {
      >= 9 => ("In Stock", 0),
      < 1 => ("Out of Stock", 1),
      < 9 => ("Low Stock", 2),
      _ => ("In Stock", 0),
    };
    return status;
  }
}
