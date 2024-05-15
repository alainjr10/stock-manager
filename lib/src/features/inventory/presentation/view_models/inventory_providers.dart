import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stock_manager/src/features/inventory/data/data_sources/local_inventory_data.dart';
import 'package:stock_manager/src/features/inventory/domain/product_model.dart';
part 'inventory_providers.g.dart';

@Riverpod(keepAlive: true)
class InventoryCrudNotifier extends _$InventoryCrudNotifier {
  Future<List<Product>> _fetchProducts() {
    final repo = ref.read(localInventoryProvider);
    return repo.getInventoryProducts();
  }

  @override
  FutureOr<List<Product>> build() {
    return _fetchProducts();
  }

  void addProductSale(List<Product> product) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(localInventoryProvider);
      await repo.addProductSale(product);
      return _fetchProducts();
    });
  }

  void updateProductSale(Product product) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(localInventoryProvider);
      await repo.updateProductSale(product);
      return _fetchProducts();
    });
  }

  void deleteProductSale(String productId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(localInventoryProvider);
      await repo.deleteProductSale(productId);
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
