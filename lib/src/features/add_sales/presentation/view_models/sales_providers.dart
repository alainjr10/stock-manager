import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stock_manager/src/features/add_sales/data/data_sources/supabase_sales_data.dart';
import 'package:stock_manager/src/features/inventory/domain/inventory_models.dart';
part 'sales_providers.g.dart';

// final totalPriceProvider =
//     StateProvider.autoDispose.family<int, List<Product>>((ref, selectedItems) {
//   int totalPrice = 0;
//   totalPrice = selectedItems.fold<int>(
//       totalPrice,
//       (previousValue, element) =>
//           previousValue + (element.sellingPrice * element.orderQty));
//   return totalPrice;
// });

@riverpod
class TotalPriceNotifier extends _$TotalPriceNotifier {
  @override
  int build() {
    return 0;
  }

  void calculateTotalPrice(List<Product> selectedItems) {
    int totalPrice = 0;
    totalPrice = selectedItems.fold<int>(
        totalPrice,
        (previousValue, element) =>
            previousValue + (element.sellingPrice * element.orderQty));
    state = totalPrice;
  }
}

@riverpod
class SalesNotifier extends _$SalesNotifier {
  Future<List<SalesProductModel>> _fetchSales() {
    final repo = ref.read(supabaseSalesProvider);
    return repo.getSales();
  }

  @override
  FutureOr<List<SalesProductModel>> build() {
    return _fetchSales();
  }
}
