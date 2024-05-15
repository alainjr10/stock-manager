// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  @JsonKey(name: 'product_id')
  String get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'cost_price')
  int get costPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'selling_price')
  int get sellingPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'stock_qty')
  int get availableQty => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_qty')
  int get orderQty => throw _privateConstructorUsedError;
  @JsonKey(name: 'safety_stock')
  int get safetyStock => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  @DateTimeToIsoConverter()
  DateTime? get dateAdded => throw _privateConstructorUsedError;
  @JsonKey(name: 'modified_at')
  @DateTimeToIsoConverter()
  DateTime? get dateModified => throw _privateConstructorUsedError;
  @JsonKey(name: 'expiry_date')
  @DateTimeToIsoConverter()
  DateTime? get expiryDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'cost_price') int costPrice,
      @JsonKey(name: 'selling_price') int sellingPrice,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'stock_qty') int availableQty,
      @JsonKey(name: 'order_qty') int orderQty,
      @JsonKey(name: 'safety_stock') int safetyStock,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'created_at')
      @DateTimeToIsoConverter()
      DateTime? dateAdded,
      @JsonKey(name: 'modified_at')
      @DateTimeToIsoConverter()
      DateTime? dateModified,
      @JsonKey(name: 'expiry_date')
      @DateTimeToIsoConverter()
      DateTime? expiryDate});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? productName = null,
    Object? costPrice = null,
    Object? sellingPrice = null,
    Object? imageUrl = freezed,
    Object? availableQty = null,
    Object? orderQty = null,
    Object? safetyStock = null,
    Object? isActive = null,
    Object? dateAdded = freezed,
    Object? dateModified = freezed,
    Object? expiryDate = freezed,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      costPrice: null == costPrice
          ? _value.costPrice
          : costPrice // ignore: cast_nullable_to_non_nullable
              as int,
      sellingPrice: null == sellingPrice
          ? _value.sellingPrice
          : sellingPrice // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      availableQty: null == availableQty
          ? _value.availableQty
          : availableQty // ignore: cast_nullable_to_non_nullable
              as int,
      orderQty: null == orderQty
          ? _value.orderQty
          : orderQty // ignore: cast_nullable_to_non_nullable
              as int,
      safetyStock: null == safetyStock
          ? _value.safetyStock
          : safetyStock // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      dateAdded: freezed == dateAdded
          ? _value.dateAdded
          : dateAdded // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateModified: freezed == dateModified
          ? _value.dateModified
          : dateModified // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'cost_price') int costPrice,
      @JsonKey(name: 'selling_price') int sellingPrice,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'stock_qty') int availableQty,
      @JsonKey(name: 'order_qty') int orderQty,
      @JsonKey(name: 'safety_stock') int safetyStock,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'created_at')
      @DateTimeToIsoConverter()
      DateTime? dateAdded,
      @JsonKey(name: 'modified_at')
      @DateTimeToIsoConverter()
      DateTime? dateModified,
      @JsonKey(name: 'expiry_date')
      @DateTimeToIsoConverter()
      DateTime? expiryDate});
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? productName = null,
    Object? costPrice = null,
    Object? sellingPrice = null,
    Object? imageUrl = freezed,
    Object? availableQty = null,
    Object? orderQty = null,
    Object? safetyStock = null,
    Object? isActive = null,
    Object? dateAdded = freezed,
    Object? dateModified = freezed,
    Object? expiryDate = freezed,
  }) {
    return _then(_$ProductImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      costPrice: null == costPrice
          ? _value.costPrice
          : costPrice // ignore: cast_nullable_to_non_nullable
              as int,
      sellingPrice: null == sellingPrice
          ? _value.sellingPrice
          : sellingPrice // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      availableQty: null == availableQty
          ? _value.availableQty
          : availableQty // ignore: cast_nullable_to_non_nullable
              as int,
      orderQty: null == orderQty
          ? _value.orderQty
          : orderQty // ignore: cast_nullable_to_non_nullable
              as int,
      safetyStock: null == safetyStock
          ? _value.safetyStock
          : safetyStock // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      dateAdded: freezed == dateAdded
          ? _value.dateAdded
          : dateAdded // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateModified: freezed == dateModified
          ? _value.dateModified
          : dateModified // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl implements _Product {
  const _$ProductImpl(
      {@JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'product_name') required this.productName,
      @JsonKey(name: 'cost_price') required this.costPrice,
      @JsonKey(name: 'selling_price') required this.sellingPrice,
      @JsonKey(name: 'image_url') this.imageUrl,
      @JsonKey(name: 'stock_qty') required this.availableQty,
      @JsonKey(name: 'order_qty') this.orderQty = 1,
      @JsonKey(name: 'safety_stock') this.safetyStock = 1,
      @JsonKey(name: 'is_active') this.isActive = true,
      @JsonKey(name: 'created_at')
      @DateTimeToIsoConverter()
      required this.dateAdded,
      @JsonKey(name: 'modified_at')
      @DateTimeToIsoConverter()
      required this.dateModified,
      @JsonKey(name: 'expiry_date')
      @DateTimeToIsoConverter()
      required this.expiryDate});

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  @JsonKey(name: 'product_id')
  final String productId;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  @JsonKey(name: 'cost_price')
  final int costPrice;
  @override
  @JsonKey(name: 'selling_price')
  final int sellingPrice;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'stock_qty')
  final int availableQty;
  @override
  @JsonKey(name: 'order_qty')
  final int orderQty;
  @override
  @JsonKey(name: 'safety_stock')
  final int safetyStock;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'created_at')
  @DateTimeToIsoConverter()
  final DateTime? dateAdded;
  @override
  @JsonKey(name: 'modified_at')
  @DateTimeToIsoConverter()
  final DateTime? dateModified;
  @override
  @JsonKey(name: 'expiry_date')
  @DateTimeToIsoConverter()
  final DateTime? expiryDate;

  @override
  String toString() {
    return 'Product(productId: $productId, productName: $productName, costPrice: $costPrice, sellingPrice: $sellingPrice, imageUrl: $imageUrl, availableQty: $availableQty, orderQty: $orderQty, safetyStock: $safetyStock, isActive: $isActive, dateAdded: $dateAdded, dateModified: $dateModified, expiryDate: $expiryDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.costPrice, costPrice) ||
                other.costPrice == costPrice) &&
            (identical(other.sellingPrice, sellingPrice) ||
                other.sellingPrice == sellingPrice) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.availableQty, availableQty) ||
                other.availableQty == availableQty) &&
            (identical(other.orderQty, orderQty) ||
                other.orderQty == orderQty) &&
            (identical(other.safetyStock, safetyStock) ||
                other.safetyStock == safetyStock) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.dateAdded, dateAdded) ||
                other.dateAdded == dateAdded) &&
            (identical(other.dateModified, dateModified) ||
                other.dateModified == dateModified) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      productId,
      productName,
      costPrice,
      sellingPrice,
      imageUrl,
      availableQty,
      orderQty,
      safetyStock,
      isActive,
      dateAdded,
      dateModified,
      expiryDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product implements Product {
  const factory _Product(
      {@JsonKey(name: 'product_id') required final String productId,
      @JsonKey(name: 'product_name') required final String productName,
      @JsonKey(name: 'cost_price') required final int costPrice,
      @JsonKey(name: 'selling_price') required final int sellingPrice,
      @JsonKey(name: 'image_url') final String? imageUrl,
      @JsonKey(name: 'stock_qty') required final int availableQty,
      @JsonKey(name: 'order_qty') final int orderQty,
      @JsonKey(name: 'safety_stock') final int safetyStock,
      @JsonKey(name: 'is_active') final bool isActive,
      @JsonKey(name: 'created_at')
      @DateTimeToIsoConverter()
      required final DateTime? dateAdded,
      @JsonKey(name: 'modified_at')
      @DateTimeToIsoConverter()
      required final DateTime? dateModified,
      @JsonKey(name: 'expiry_date')
      @DateTimeToIsoConverter()
      required final DateTime? expiryDate}) = _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  @JsonKey(name: 'product_id')
  String get productId;
  @override
  @JsonKey(name: 'product_name')
  String get productName;
  @override
  @JsonKey(name: 'cost_price')
  int get costPrice;
  @override
  @JsonKey(name: 'selling_price')
  int get sellingPrice;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @override
  @JsonKey(name: 'stock_qty')
  int get availableQty;
  @override
  @JsonKey(name: 'order_qty')
  int get orderQty;
  @override
  @JsonKey(name: 'safety_stock')
  int get safetyStock;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'created_at')
  @DateTimeToIsoConverter()
  DateTime? get dateAdded;
  @override
  @JsonKey(name: 'modified_at')
  @DateTimeToIsoConverter()
  DateTime? get dateModified;
  @override
  @JsonKey(name: 'expiry_date')
  @DateTimeToIsoConverter()
  DateTime? get expiryDate;
  @override
  @JsonKey(ignore: true)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SalesModel _$SalesModelFromJson(Map<String, dynamic> json) {
  return _SalesModel.fromJson(json);
}

/// @nodoc
mixin _$SalesModel {
  @JsonKey(name: 'sale_id')
  String get saleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  String get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'selling_price')
  int get sellingPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty_sold')
  int get qtySold => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  @DateTimeToIsoConverter()
  DateTime? get dateAdded => throw _privateConstructorUsedError;
  @JsonKey(name: 'modified_at')
  @DateTimeToIsoConverter()
  DateTime? get dateModified => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalesModelCopyWith<SalesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesModelCopyWith<$Res> {
  factory $SalesModelCopyWith(
          SalesModel value, $Res Function(SalesModel) then) =
      _$SalesModelCopyWithImpl<$Res, SalesModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'sale_id') String saleId,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'selling_price') int sellingPrice,
      @JsonKey(name: 'qty_sold') int qtySold,
      @JsonKey(name: 'created_at')
      @DateTimeToIsoConverter()
      DateTime? dateAdded,
      @JsonKey(name: 'modified_at')
      @DateTimeToIsoConverter()
      DateTime? dateModified});
}

/// @nodoc
class _$SalesModelCopyWithImpl<$Res, $Val extends SalesModel>
    implements $SalesModelCopyWith<$Res> {
  _$SalesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saleId = null,
    Object? productId = null,
    Object? sellingPrice = null,
    Object? qtySold = null,
    Object? dateAdded = freezed,
    Object? dateModified = freezed,
  }) {
    return _then(_value.copyWith(
      saleId: null == saleId
          ? _value.saleId
          : saleId // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      sellingPrice: null == sellingPrice
          ? _value.sellingPrice
          : sellingPrice // ignore: cast_nullable_to_non_nullable
              as int,
      qtySold: null == qtySold
          ? _value.qtySold
          : qtySold // ignore: cast_nullable_to_non_nullable
              as int,
      dateAdded: freezed == dateAdded
          ? _value.dateAdded
          : dateAdded // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateModified: freezed == dateModified
          ? _value.dateModified
          : dateModified // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalesModelImplCopyWith<$Res>
    implements $SalesModelCopyWith<$Res> {
  factory _$$SalesModelImplCopyWith(
          _$SalesModelImpl value, $Res Function(_$SalesModelImpl) then) =
      __$$SalesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'sale_id') String saleId,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'selling_price') int sellingPrice,
      @JsonKey(name: 'qty_sold') int qtySold,
      @JsonKey(name: 'created_at')
      @DateTimeToIsoConverter()
      DateTime? dateAdded,
      @JsonKey(name: 'modified_at')
      @DateTimeToIsoConverter()
      DateTime? dateModified});
}

/// @nodoc
class __$$SalesModelImplCopyWithImpl<$Res>
    extends _$SalesModelCopyWithImpl<$Res, _$SalesModelImpl>
    implements _$$SalesModelImplCopyWith<$Res> {
  __$$SalesModelImplCopyWithImpl(
      _$SalesModelImpl _value, $Res Function(_$SalesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? saleId = null,
    Object? productId = null,
    Object? sellingPrice = null,
    Object? qtySold = null,
    Object? dateAdded = freezed,
    Object? dateModified = freezed,
  }) {
    return _then(_$SalesModelImpl(
      saleId: null == saleId
          ? _value.saleId
          : saleId // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      sellingPrice: null == sellingPrice
          ? _value.sellingPrice
          : sellingPrice // ignore: cast_nullable_to_non_nullable
              as int,
      qtySold: null == qtySold
          ? _value.qtySold
          : qtySold // ignore: cast_nullable_to_non_nullable
              as int,
      dateAdded: freezed == dateAdded
          ? _value.dateAdded
          : dateAdded // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateModified: freezed == dateModified
          ? _value.dateModified
          : dateModified // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalesModelImpl implements _SalesModel {
  const _$SalesModelImpl(
      {@JsonKey(name: 'sale_id') required this.saleId,
      @JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'selling_price') required this.sellingPrice,
      @JsonKey(name: 'qty_sold') required this.qtySold,
      @JsonKey(name: 'created_at')
      @DateTimeToIsoConverter()
      required this.dateAdded,
      @JsonKey(name: 'modified_at')
      @DateTimeToIsoConverter()
      required this.dateModified});

  factory _$SalesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalesModelImplFromJson(json);

  @override
  @JsonKey(name: 'sale_id')
  final String saleId;
  @override
  @JsonKey(name: 'product_id')
  final String productId;
  @override
  @JsonKey(name: 'selling_price')
  final int sellingPrice;
  @override
  @JsonKey(name: 'qty_sold')
  final int qtySold;
  @override
  @JsonKey(name: 'created_at')
  @DateTimeToIsoConverter()
  final DateTime? dateAdded;
  @override
  @JsonKey(name: 'modified_at')
  @DateTimeToIsoConverter()
  final DateTime? dateModified;

  @override
  String toString() {
    return 'SalesModel(saleId: $saleId, productId: $productId, sellingPrice: $sellingPrice, qtySold: $qtySold, dateAdded: $dateAdded, dateModified: $dateModified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesModelImpl &&
            (identical(other.saleId, saleId) || other.saleId == saleId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.sellingPrice, sellingPrice) ||
                other.sellingPrice == sellingPrice) &&
            (identical(other.qtySold, qtySold) || other.qtySold == qtySold) &&
            (identical(other.dateAdded, dateAdded) ||
                other.dateAdded == dateAdded) &&
            (identical(other.dateModified, dateModified) ||
                other.dateModified == dateModified));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, saleId, productId, sellingPrice,
      qtySold, dateAdded, dateModified);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesModelImplCopyWith<_$SalesModelImpl> get copyWith =>
      __$$SalesModelImplCopyWithImpl<_$SalesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalesModelImplToJson(
      this,
    );
  }
}

abstract class _SalesModel implements SalesModel {
  const factory _SalesModel(
      {@JsonKey(name: 'sale_id') required final String saleId,
      @JsonKey(name: 'product_id') required final String productId,
      @JsonKey(name: 'selling_price') required final int sellingPrice,
      @JsonKey(name: 'qty_sold') required final int qtySold,
      @JsonKey(name: 'created_at')
      @DateTimeToIsoConverter()
      required final DateTime? dateAdded,
      @JsonKey(name: 'modified_at')
      @DateTimeToIsoConverter()
      required final DateTime? dateModified}) = _$SalesModelImpl;

  factory _SalesModel.fromJson(Map<String, dynamic> json) =
      _$SalesModelImpl.fromJson;

  @override
  @JsonKey(name: 'sale_id')
  String get saleId;
  @override
  @JsonKey(name: 'product_id')
  String get productId;
  @override
  @JsonKey(name: 'selling_price')
  int get sellingPrice;
  @override
  @JsonKey(name: 'qty_sold')
  int get qtySold;
  @override
  @JsonKey(name: 'created_at')
  @DateTimeToIsoConverter()
  DateTime? get dateAdded;
  @override
  @JsonKey(name: 'modified_at')
  @DateTimeToIsoConverter()
  DateTime? get dateModified;
  @override
  @JsonKey(ignore: true)
  _$$SalesModelImplCopyWith<_$SalesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SalesProductModel {
  SalesModel get salesModel => throw _privateConstructorUsedError;
  @JsonKey(name: 'inventory')
  Product get product => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SalesProductModelCopyWith<SalesProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesProductModelCopyWith<$Res> {
  factory $SalesProductModelCopyWith(
          SalesProductModel value, $Res Function(SalesProductModel) then) =
      _$SalesProductModelCopyWithImpl<$Res, SalesProductModel>;
  @useResult
  $Res call(
      {SalesModel salesModel, @JsonKey(name: 'inventory') Product product});

  $SalesModelCopyWith<$Res> get salesModel;
  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class _$SalesProductModelCopyWithImpl<$Res, $Val extends SalesProductModel>
    implements $SalesProductModelCopyWith<$Res> {
  _$SalesProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesModel = null,
    Object? product = null,
  }) {
    return _then(_value.copyWith(
      salesModel: null == salesModel
          ? _value.salesModel
          : salesModel // ignore: cast_nullable_to_non_nullable
              as SalesModel,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesModelCopyWith<$Res> get salesModel {
    return $SalesModelCopyWith<$Res>(_value.salesModel, (value) {
      return _then(_value.copyWith(salesModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SalesProductModelImplCopyWith<$Res>
    implements $SalesProductModelCopyWith<$Res> {
  factory _$$SalesProductModelImplCopyWith(_$SalesProductModelImpl value,
          $Res Function(_$SalesProductModelImpl) then) =
      __$$SalesProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SalesModel salesModel, @JsonKey(name: 'inventory') Product product});

  @override
  $SalesModelCopyWith<$Res> get salesModel;
  @override
  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$SalesProductModelImplCopyWithImpl<$Res>
    extends _$SalesProductModelCopyWithImpl<$Res, _$SalesProductModelImpl>
    implements _$$SalesProductModelImplCopyWith<$Res> {
  __$$SalesProductModelImplCopyWithImpl(_$SalesProductModelImpl _value,
      $Res Function(_$SalesProductModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesModel = null,
    Object? product = null,
  }) {
    return _then(_$SalesProductModelImpl(
      salesModel: null == salesModel
          ? _value.salesModel
          : salesModel // ignore: cast_nullable_to_non_nullable
              as SalesModel,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }
}

/// @nodoc

class _$SalesProductModelImpl implements _SalesProductModel {
  const _$SalesProductModelImpl(
      {required this.salesModel,
      @JsonKey(name: 'inventory') required this.product});

  @override
  final SalesModel salesModel;
  @override
  @JsonKey(name: 'inventory')
  final Product product;

  @override
  String toString() {
    return 'SalesProductModel(salesModel: $salesModel, product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesProductModelImpl &&
            (identical(other.salesModel, salesModel) ||
                other.salesModel == salesModel) &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesModel, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesProductModelImplCopyWith<_$SalesProductModelImpl> get copyWith =>
      __$$SalesProductModelImplCopyWithImpl<_$SalesProductModelImpl>(
          this, _$identity);
}

abstract class _SalesProductModel implements SalesProductModel {
  const factory _SalesProductModel(
          {required final SalesModel salesModel,
          @JsonKey(name: 'inventory') required final Product product}) =
      _$SalesProductModelImpl;

  @override
  SalesModel get salesModel;
  @override
  @JsonKey(name: 'inventory')
  Product get product;
  @override
  @JsonKey(ignore: true)
  _$$SalesProductModelImplCopyWith<_$SalesProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
