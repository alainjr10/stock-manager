import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stock_manager/src/features/inventory/data/data_sources/supabase_inventory_data.dart';
import 'package:stock_manager/src/features/inventory/data/services/inventory_alt_services.dart';
import 'package:stock_manager/src/features/inventory/domain/inventory_models.dart';
part 'inventory_providers.g.dart';

// 0 for in stock, 1 for out of stock, 2 for low stock, 3 for expired, 4 for approaching expiry date
@riverpod
(String, int) productStatus(ProductStatusRef ref, {required Product product}) {
  return InventoryAltServices.productStatusProvider(product: product);
}

@Riverpod(keepAlive: true)
class InventoryCrudNotifier extends _$InventoryCrudNotifier {
  Future<List<Product>> _fetchProducts() {
    final repo = ref.read(supabaseInventoryProvider);
    return repo.getInventoryProducts();
  }

  @override
  FutureOr<List<Product>> build() {
    return _fetchProducts();
  }

  void addProductSale(List<Product> product) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(supabaseInventoryProvider);
      await repo.addProductSale(product);
      return _fetchProducts();
    });
  }

  void updateProductSale(SalesModel sale) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(supabaseInventoryProvider);
      await repo.updateProductSale(sale);
      return _fetchProducts();
    });
  }

  void deleteProductSale(String saleId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(supabaseInventoryProvider);
      await repo.deleteProductSale(saleId);
      return _fetchProducts();
    });
  }
}

@Riverpod(keepAlive: true)
class ItemsToSellNotifier extends _$ItemsToSellNotifier {
  @override
  List<Product> build() {
    return [];
  }

  void addProduct(Product product) {
    state = [...state, product];
  }

  void removeProduct(Product product) {
    state = state
        .where((element) => element.productId != product.productId)
        .toList();
  }

  void toggleSelection(Product product) {
    if (state.contains(product)) {
      removeProduct(product);
    } else {
      addProduct(product);
    }
  }

  void selectAllProducts(List<Product> products) {
    state = products;
  }

  void clearProducts() {
    state = [];
  }

  void toggleAllSelection(List<Product> products) {
    if (state.length == products.length) {
      clearProducts();
    } else {
      selectAllProducts(products);
    }
  }
}
