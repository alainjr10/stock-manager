// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productStatusHash() => r'14185e4a812b26fa98ec3252c92475dd7aff7463';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [productStatus].
@ProviderFor(productStatus)
const productStatusProvider = ProductStatusFamily();

/// See also [productStatus].
class ProductStatusFamily extends Family<(String, int)> {
  /// See also [productStatus].
  const ProductStatusFamily();

  /// See also [productStatus].
  ProductStatusProvider call({
    required Product product,
  }) {
    return ProductStatusProvider(
      product: product,
    );
  }

  @override
  ProductStatusProvider getProviderOverride(
    covariant ProductStatusProvider provider,
  ) {
    return call(
      product: provider.product,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'productStatusProvider';
}

/// See also [productStatus].
class ProductStatusProvider extends AutoDisposeProvider<(String, int)> {
  /// See also [productStatus].
  ProductStatusProvider({
    required Product product,
  }) : this._internal(
          (ref) => productStatus(
            ref as ProductStatusRef,
            product: product,
          ),
          from: productStatusProvider,
          name: r'productStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productStatusHash,
          dependencies: ProductStatusFamily._dependencies,
          allTransitiveDependencies:
              ProductStatusFamily._allTransitiveDependencies,
          product: product,
        );

  ProductStatusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.product,
  }) : super.internal();

  final Product product;

  @override
  Override overrideWith(
    (String, int) Function(ProductStatusRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProductStatusProvider._internal(
        (ref) => create(ref as ProductStatusRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        product: product,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<(String, int)> createElement() {
    return _ProductStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductStatusProvider && other.product == product;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, product.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProductStatusRef on AutoDisposeProviderRef<(String, int)> {
  /// The parameter `product` of this provider.
  Product get product;
}

class _ProductStatusProviderElement
    extends AutoDisposeProviderElement<(String, int)> with ProductStatusRef {
  _ProductStatusProviderElement(super.provider);

  @override
  Product get product => (origin as ProductStatusProvider).product;
}

String _$inventoryCrudNotifierHash() =>
    r'8c3413b80eb71abc38487035173b664f15869e3a';

/// See also [InventoryCrudNotifier].
@ProviderFor(InventoryCrudNotifier)
final inventoryCrudNotifierProvider =
    AsyncNotifierProvider<InventoryCrudNotifier, List<Product>>.internal(
  InventoryCrudNotifier.new,
  name: r'inventoryCrudNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$inventoryCrudNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$InventoryCrudNotifier = AsyncNotifier<List<Product>>;
String _$itemsToSellNotifierHash() =>
    r'5d7d57f5f3a7a916148a2cc7a02e1f6bf8ca9bf7';

/// See also [ItemsToSellNotifier].
@ProviderFor(ItemsToSellNotifier)
final itemsToSellNotifierProvider =
    NotifierProvider<ItemsToSellNotifier, List<Product>>.internal(
  ItemsToSellNotifier.new,
  name: r'itemsToSellNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$itemsToSellNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ItemsToSellNotifier = Notifier<List<Product>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
