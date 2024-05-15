import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stock_manager/src/features/add_sales/data/data_sources/supabase_sales_data.dart';
import 'package:stock_manager/src/features/inventory/domain/inventory_models.dart';
part 'sales_providers.g.dart';

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
