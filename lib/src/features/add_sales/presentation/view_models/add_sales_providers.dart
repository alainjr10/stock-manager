import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stock_manager/src/features/add_sales/data/data_sources/add_sales_local_data.dart';
import 'package:stock_manager/src/features/inventory/domain/product_model.dart';
part 'add_sales_providers.g.dart';

@riverpod
class AddSalesNotifier extends _$AddSalesNotifier {
  @override
  FutureOr<void> build() {}
  void sellItems(List<Product> product) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(addSalesRepoProvider);
      await repo.addSales(product);
    });
  }
}
