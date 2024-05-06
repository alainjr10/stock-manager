import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stock_manager/src/features/inventory/data/data_sources/local_inventory_data.dart';
import 'package:stock_manager/src/features/inventory/domain/product_model.dart';
part 'inventory_providers.g.dart';

@riverpod
FutureOr<List<Product>> getInventoryProducts(GetInventoryProductsRef ref) {
  final repo = ref.read(localInventoryProvider);
  return repo.getInventoryProducts();
}
