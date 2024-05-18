import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stock_manager/src/features/inventory/data/data_sources/supabase_inventory_data.dart';
import 'package:stock_manager/src/features/inventory/data/services/inventory_alt_services.dart';
import 'package:stock_manager/src/features/inventory/domain/inventory_models.dart';
import 'package:stock_manager/src/utils/extensions/extensions.dart';
part 'inventory_providers.g.dart';

// 0 for in stock, 1 for out of stock, 2 for low stock, 3 for expired, 4 for approaching expiry date
@riverpod
(String, int) productStatus(ProductStatusRef ref, {required Product product}) {
  return InventoryAltServices.productStatusProvider(product: product);
}

final generalDurationCode = StateProvider<int>((ref) => 1);

@Riverpod(keepAlive: true)
class InventoryCrudNotifier extends _$InventoryCrudNotifier {
  Future<List<Product>> _fetchProducts() {
    final repo = ref.read(supabaseInventoryProvider);
    ref.read(getInventoryProductNamesProvider);
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

@riverpod
FutureOr<(int, int)> getTotalProducts(
    GetTotalProductsRef ref, int durationCode) {
  final repo = ref.read(supabaseInventoryProvider);
  return repo.getTotalActiveProducts(durationCode);
}

@riverpod
FutureOr<int> getLowStockCount(GetLowStockCountRef ref, int durationCode) {
  final repo = ref.read(supabaseInventoryProvider);
  return repo.getLowStockProductsCount(durationCode);
}

@riverpod
FutureOr<(int, int)> getSoldProducts(GetSoldProductsRef ref, int durationCode) {
  final repo = ref.read(supabaseInventoryProvider);
  return repo.getTotalSoldProducts(durationCode);
}

@riverpod
FutureOr<int> getSalesValue(GetSalesValueRef ref, int durationCode) {
  final repo = ref.read(supabaseInventoryProvider);
  return repo.getTotalSalesValue(durationCode);
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

@Riverpod(keepAlive: true)
FutureOr<List<String>> getInventoryProductNames(
    GetInventoryProductNamesRef ref) {
  final repo = ref.read(supabaseInventoryProvider);
  return repo.getInventoryProductNames();
}

final searchQueryProvider = StateProvider.autoDispose<String>((ref) => '');
final isSearchFieldActiveProvider =
    StateProvider.autoDispose<bool>((ref) => false);

final filteredProductNamesProvider =
    StateProvider.autoDispose<List<String>>((ref) {
  final allNames = ref.watch(getInventoryProductNamesProvider);
  final searchQuery = ref.watch(searchQueryProvider);
  final names = searchQuery.isEmpty || searchQuery.length < 3
      ? <String>[]
      : allNames.maybeWhen(
          data: (names) => names
              .where((name) =>
                  name.toLowerCase().contains(searchQuery.toLowerCase()))
              .toList(),
          orElse: () => <String>[],
        );
  // 'filtered names: $names\nlength ${names.length}'.log();
  return names;
});

@riverpod
class SearchProductsNotifier extends _$SearchProductsNotifier {
  late Object? key;
  @override
  FutureOr<List<Product>> build() async {
    key = Object;
    ref.onDispose(() {
      'provider disposed'.log();
      return key = null;
    });
    return [];
  }

  void searchProducts(String query) async {
    final key = this.key;
    state = const AsyncLoading();
    if (key == this.key) {
      state = await AsyncValue.guard(() async {
        // await Future.delayed(const Duration(milliseconds: 2000));
        final repo = ref.read(supabaseInventoryProvider);
        final result = await repo.searchProducts(query);
        return result;
      });
    } else {
      'state is no longer mounted'.log();
    }
  }
}

@riverpod
class SearchSalesNotifier extends _$SearchSalesNotifier {
  @override
  FutureOr<List<SalesProductModel>> build() {
    return [];
  }

  void searchSales(String query) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(supabaseInventoryProvider);
      return repo.searchSales(query);
    });
  }
}
