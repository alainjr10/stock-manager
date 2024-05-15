import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_manager/src/features/inventory/domain/inventory_models.dart';
import 'package:stock_manager/src/utils/extensions/extensions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class SupabaseSalesData {
  final _supabase = Supabase.instance.client;
  final _uuid = const Uuid();
  Future<List<SalesProductModel>> getSales() async {
    try {
      final data = await _supabase
          .from('sales')
          .select('*, inventory(*)')
          .count(CountOption.exact);
      final sales = data.data.map((e) {
        final salesVal = SalesModel.fromJson(e);
        final product = Product.fromJson(e['inventory']);
        return SalesProductModel(salesModel: salesVal, product: product);
      }).toList();
      return sales;
    } catch (e, st) {
      'error getting sales: $e: stacktrace: $st'.log();
      rethrow;
    }
  }

  Future<Product> getProductById(String productId) async {
    try {
      final data = await _supabase
          .from('inventory')
          .select()
          .eq('product_id', productId)
          .limit(1)
          .single();
      final product = Product.fromJson(data);
      return product;
    } catch (e, st) {
      'error getting product by id: $e: stacktrace: $st'.log();
      rethrow;
    }
  }

  Future<void> addSale(Product product) async {
    try {
      final sale = SalesModel(
        saleId: _uuid.v4(),
        productId: product.productId,
        sellingPrice: product.sellingPrice,
        qtySold: product.orderQty,
        dateAdded: DateTime.now(),
        dateModified: DateTime.now(),
      );
      await _supabase.from('sales').upsert(sale.toJson());
    } catch (e, st) {
      'error adding sale: $e: stacktrace: $st'.log();
      rethrow;
    }
  }

  Future<void> updateInventoryAfterSale(Product product) async {
    try {
      final newProduct = product.copyWith(
        availableQty: product.availableQty - product.orderQty,
        dateModified: DateTime.now(),
      );
      await _supabase
          .from('inventory')
          .update(newProduct.toJson())
          .eq('product_id', product.productId);
    } catch (e, st) {
      'error updating product: $e: stacktrace: $st'.log();
      rethrow;
    }
  }

  Future<void> addProductSale(List<Product> products) async {
    try {
      for (var product in products) {
        await addSale(product);
        await updateInventoryAfterSale(product);
      }
    } catch (e, st) {
      'error adding product sale: $e: stacktrace: $st'.log();
      rethrow;
    }
  }

  Future<void> updateProductSale(SalesModel sales) async {
    try {
      await _supabase
          .from('sales')
          .update(sales.toJson())
          .eq('sale_id', sales.saleId);
    } catch (e, st) {
      'error updating product sale: $e: stacktrace: $st'.log();
      rethrow;
    }
  }

  Future<void> deleteProductSale(String saleId) async {
    try {
      await _supabase.from('sales').delete().eq('sale_id', saleId);
    } catch (e, st) {
      'error deleting product sale: $e: stacktrace: $st'.log();
      rethrow;
    }
  }
}

final supabaseSalesProvider = Provider((ref) => SupabaseSalesData());
