import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stock_manager/src/features/inventory/domain/product_model.dart';

class AddSalesLocalData {
  Future<void> addSales(List<Product> products) async {
    // Add sales to local database
    await Future.delayed(const Duration(milliseconds: 2500));
    // await Future.error("error");
  }
}

final addSalesRepoProvider = Provider((ref) => AddSalesLocalData());
