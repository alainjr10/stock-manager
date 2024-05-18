import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_manager/src/features/inventory/domain/inventory_models.dart';
import 'package:stock_manager/src/utils/extensions/extensions.dart';
import 'package:stock_manager/src/utils/extensions/string.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class SupabaseInventoryData {
  final _supabase = Supabase.instance.client;
  final _uuid = const Uuid();
  Future<List<Product>> getInventoryProducts() async {
    try {
      final data = await _supabase
          .from('inventory')
          .select()
          .eq('is_active', true)
          .count(CountOption.exact);
      final products = data.data.map((e) {
        return Product.fromJson(e);
      }).toList();
      return products;
    } catch (e, st) {
      'error getting inventory products: $e: stacktrace: $st'.log();
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

  // get total active products in inventory. that is, products with is_active and each product * their stock qty
  Future<(int, int)> getTotalActiveProducts(int durationCode) async {
    try {
      // final endDate = DateTime.now();
      final startDate = durationCode.startDate;
      final data = await _supabase
          .from('inventory')
          .select('stock_qty')
          .eq('is_active', true)
          .gt('stock_qty', 0)
          .gte('created_at', startDate)
          .count(CountOption.exact);
      final total = data.data.fold<int>(
          0,
          (previousValue, element) =>
              previousValue + element['stock_qty'] as int);
      return (total, data.count);
    } catch (e, st) {
      'error getting total active products: $e: stacktrace: $st'.log();
      rethrow;
    }
  }

  /// CHECK [extensions/num.dart] extension FOR THE DURATION CODES and [startDate] extension
  Future<(int, int)> getTotalSoldProducts(int durationCode) async {
    try {
      final startDate = durationCode.startDate;
      final data = await _supabase
          .from('sales')
          .select('qty_sold')
          .gte('created_at', startDate)
          .count(CountOption.exact);
      final total = data.data.fold<int>(
          0,
          (previousValue, element) =>
              previousValue + element['qty_sold'] as int);
      return (total, data.count);
    } catch (e, st) {
      'error getting total sold products: $e: stacktrace: $st'.log();
      rethrow;
    }
  }

  Future<int> getLowStockProductsCount(int durationCode) async {
    try {
      // final endDate = DateTime.now();
      final startDate = durationCode.startDate;
      final data = await _supabase
          .from('inventory')
          .select('stock_qty, safety_stock')
          .eq('is_active', true)
          .gt('stock_qty', 0)
          .eq('is_critical_stock', true)
          .gte('created_at', startDate)
          .count(CountOption.exact);
      return data.count;
    } catch (e, st) {
      'error getting total active products: $e: stacktrace: $st'.log();
      rethrow;
    }
  }

  // now let's calculate sales value for a given duration
  Future<int> getTotalSalesValue(int durationCode) async {
    try {
      DateTime startDate = durationCode.startDate;

      final data = await _supabase
          .from('sales')
          .select('selling_price, qty_sold')
          .gte('created_at', startDate)
          .count(CountOption.exact);
      final total = data.data.fold<int>(
          0,
          (previousValue, element) =>
              previousValue +
              ((element['selling_price'] as int) *
                  (element['qty_sold'] as int)));
      return total;
    } catch (e, st) {
      'error getting total sales value: $e: stacktrace: $st'.log();
      rethrow;
    }
  }

  Future<List<String>> getInventoryProductNames() async {
    try {
      final data = await _supabase
          .from('inventory')
          .select('product_name')
          .eq('is_active', true);
      final products = data.map((e) {
        return (e['product_name'] as String).toLowerCase();
      }).toList();
      return products;
    } catch (e, st) {
      'error getting inventory product names: $e: stacktrace: $st'.log();
      rethrow;
    }
  }

  Future<List<Product>> searchProducts(String query) async {
    try {
      query = query.toSupabasePhaseQuery;
      final data = await _supabase
          .from('inventory')
          .select()
          .textSearch('product_name', "'$query'");
      final products = data.map((e) {
        return Product.fromJson(e);
      }).toList();
      // 'searched prods has lenth: ${products.length}'.log();
      return products;
    } catch (e, st) {
      'error searching products: $e: stacktrace: $st'.log();
      rethrow;
    }
  }

  // search sales table based on product name where product_name is a column in the inventory table and we have a foreign key linking both tables
  Future<List<SalesProductModel>> searchSales(String query) async {
    try {
      query = query.toSupabasePhaseQuery;
      final data = await _supabase
          .from('sales')
          .select('*, inventory!inner(*)')
          .textSearch('inventory.product_name', "'$query'");
      final sales = data.map((e) {
        final sales = SalesModel.fromJson(e);
        final product = Product.fromJson(e['inventory']);
        return SalesProductModel(
          salesModel: sales,
          product: product,
        );
      }).toList();
      return sales;
    } catch (e, st) {
      'error searching sales: $e: stacktrace: $st'.log();
      rethrow;
    }
  }
}

final supabaseInventoryProvider = Provider((ref) => SupabaseInventoryData());
