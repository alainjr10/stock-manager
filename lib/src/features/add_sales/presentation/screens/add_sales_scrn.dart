import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_manager/src/common/widgets/buttons.dart';
import 'package:stock_manager/src/common/widgets/text_form_fields.dart';
import 'package:stock_manager/src/features/add_sales/presentation/view_models/sales_providers.dart';
import 'package:stock_manager/src/features/add_sales/presentation/widgets/sales_fetch_widgets.dart';
import 'package:stock_manager/src/features/inventory/domain/inventory_models.dart';
import 'package:stock_manager/src/features/inventory/presentation/view_models/inventory_providers.dart';
import 'package:stock_manager/src/utils/constants/constants.dart';
import 'package:stock_manager/src/utils/extensions/extensions.dart';

class AddSalesScreen extends StatefulHookConsumerWidget {
  const AddSalesScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddSalesScreenState();
}

class _AddSalesScreenState extends ConsumerState<AddSalesScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final searchController = useTextEditingController();
    // final selectedFilterDuration = ref.watch(generalDurationCode);
    FocusNode focusNode = useFocusNode();
    final searchFieldIsActive = ref.watch(isSearchFieldActiveProvider);
    final searchedProds = ref.watch(searchProductsNotifierProvider);
    focusNode.addListener(() {
      if (focusNode.hasFocus && !searchFieldIsActive) {
        ref.read(isSearchFieldActiveProvider.notifier).state =
            focusNode.hasFocus;
      }
    });
    final selectedItems = ref.watch(itemsToSellNotifierProvider);
    final selectedItemsMap = ref.watch(selectedItemsMapProvider);
    int totalPrice = ref.watch(totalPriceNotifierProvider);
    // double totalPrice = 0;
    // totalPrice = selectedItems.fold<double>(
    //     totalPrice,
    //     (previousValue, element) =>
    //         previousValue + (element.sellingPrice * element.orderQty));
    ref.listen(inventoryCrudNotifierProvider, (_, state) {
      if (!state.hasError && !state.isLoading) {
        'Sales added successfully'.log();
        ref.invalidate(itemsToSellNotifierProvider);
        context.pop();
      } else if (state.hasError) {
        'Error adding sales: ${state.error}'.log();
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sell an Item"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Row(
            children: [
              const Expanded(
                child: SizedBox(),
              ),
              SizedBox(
                width: size.width >= 1500 ? 1100 : size.width * 0.8,
                height: size.height * 0.9,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: context.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(kCardRadius),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * 0.45,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Select the item(s) you want to sell",
                                style: context.titleMedium.bold500,
                              ),
                              20.vGap,
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 40,
                                      child: CustomInputFormField(
                                        hintText: "Search Product",
                                        controller: searchController,
                                        focusNode: focusNode,
                                        onSubmitted: (p0) {
                                          'submitted with value $p0'.log();
                                          ref
                                              .read(
                                                  searchProductsNotifierProvider
                                                      .notifier)
                                              .searchProducts(query: p0);
                                          // ref.read(searchProductsProvider(p0));
                                          focusNode.unfocus();
                                          ref
                                              .read(isSearchFieldActiveProvider
                                                  .notifier)
                                              .state = false;
                                        },
                                        validator: (p0) {
                                          return null;
                                        },
                                        onChanged: (value) {
                                          ref
                                              .read(
                                                  searchQueryProvider.notifier)
                                              .update((state) => value);
                                          ref.read(
                                              filteredProductNamesProvider);
                                        },
                                        onClear: () {
                                          searchController.clear();
                                          focusNode.unfocus();
                                          ref
                                              .read(isSearchFieldActiveProvider
                                                  .notifier)
                                              .state = false;
                                          ref
                                              .read(
                                                  searchQueryProvider.notifier)
                                              .update((state) => '');
                                          ref
                                              .read(filteredProductNamesProvider
                                                  .notifier)
                                              .state = [];
                                        },
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          vertical: 4.0,
                                          horizontal: 8.0,
                                        ),
                                      ),
                                    ),
                                    // child: TextFormField(
                                    //   controller: searchController,
                                    //   cursorColor:
                                    //       context.colorScheme.secondary,
                                    //   decoration: InputDecoration(
                                    //     hintText: "Search for a product",
                                    //     prefixIcon: const Icon(
                                    //       Icons.search,
                                    //     ),
                                    //     suffixIcon: IconButton(
                                    //       onPressed: () {},
                                    //       icon: const Icon(Icons.close),
                                    //     ),
                                    //     prefixIconColor: context
                                    //         .colorScheme.secondary
                                    //         .withOpacity(0.7),
                                    //     suffixIconColor:
                                    //         context.colorScheme.secondary,
                                    //     focusedBorder: OutlineInputBorder(
                                    //       borderRadius:
                                    //           BorderRadius.circular(16),
                                    //       borderSide: BorderSide(
                                    //         width: 0.4,
                                    //         color:
                                    //             context.colorScheme.secondary,
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: SizedBox(
                                  // height: 200,
                                  child: searchFieldIsActive
                                      ? SizedBox(
                                          child: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ...ref
                                                    .watch(
                                                        filteredProductNamesProvider)
                                                    .map((e) {
                                                  return ListTile(
                                                    onTap: () {
                                                      // ref
                                                      //     .read(searchQueryProvider
                                                      //         .notifier)
                                                      //     .update((state) => e);
                                                      ref
                                                          .read(
                                                              filteredProductNamesProvider
                                                                  .notifier)
                                                          .state = [];
                                                      ref
                                                          .read(
                                                              searchProductsNotifierProvider
                                                                  .notifier)
                                                          .searchProducts(
                                                              query: e,
                                                              searchFullText:
                                                                  true);
                                                      searchController.text = e;
                                                      'searching for $e'.log();
                                                      focusNode.unfocus();
                                                      ref
                                                              .read(
                                                                  isSearchFieldActiveProvider
                                                                      .notifier)
                                                              .state =
                                                          focusNode.hasFocus;
                                                    },
                                                    title: Text(e),
                                                    trailing: Icon(
                                                      Icons
                                                          .arrow_outward_rounded,
                                                      color: context.colorScheme
                                                          .secondary,
                                                    ),
                                                  );
                                                }),
                                              ],
                                            ),
                                          ),
                                        )
                                      : searchController.text.isNotEmpty
                                          ? searchedProds.when(
                                              error: (error, stackTrace) {
                                                return SalesErrorWidget(
                                                  invalidateProvider:
                                                      inventoryCrudNotifierProvider,
                                                );
                                              },
                                              loading: () {
                                                return const SalesLoadingWidget();
                                              },
                                              data: (products) {
                                                return AddSalesDataWidget(
                                                  selectedItems: selectedItems,
                                                  products: products,
                                                );
                                              },
                                            )
                                          : ref
                                              .watch(
                                                  inventoryCrudNotifierProvider)
                                              .when(
                                              error: (error, stackTrace) {
                                                return SalesErrorWidget(
                                                  invalidateProvider:
                                                      inventoryCrudNotifierProvider,
                                                );
                                              },
                                              loading: () {
                                                return const SalesLoadingWidget();
                                              },
                                              data: (products) {
                                                return AddSalesDataWidget(
                                                  selectedItems: selectedItems,
                                                  products: products,
                                                );
                                              },
                                            ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      8.vGap,
                      const Divider(thickness: 1),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Selected Items",
                                  style: context.titleMedium.bold500,
                                ),
                                Expanded(
                                  child: SizedBox(
                                    // height: 200,
                                    child: selectedItems.isEmpty
                                        ? const Center(
                                            child: Text(
                                                "No items selected yet. Select an item above"),
                                          )
                                        : DataTable2(
                                            columnSpacing: 80,
                                            horizontalMargin: 12,
                                            minWidth: 600,
                                            dividerThickness: 0.25,
                                            columns: [
                                              DataColumn2(
                                                label: Text(
                                                  'Product',
                                                  style: context.bodySmall
                                                      .secondaryColor.bold,
                                                ),
                                                size: ColumnSize.L,
                                              ),
                                              DataColumn2(
                                                label: Text(
                                                  'Stock',
                                                  style: context.bodySmall
                                                      .secondaryColor.bold,
                                                ),
                                                size: ColumnSize.S,
                                                fixedWidth: 140,
                                              ),
                                              DataColumn2(
                                                label: Text(
                                                  'Price',
                                                  style: context.bodySmall
                                                      .secondaryColor.bold,
                                                ),
                                              ),
                                              DataColumn2(
                                                label: Text(
                                                  'Last Order Date',
                                                  style: context.bodySmall
                                                      .secondaryColor.bold,
                                                ),
                                              ),
                                            ],
                                            rows: [
                                              for (Product product
                                                  in selectedItems)
                                                DataRow(
                                                  cells: [
                                                    DataCell(
                                                      Text(
                                                        product.productName,
                                                        style: context.bodySmall
                                                            .secondaryColor,
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                    DataCell(
                                                      Text(
                                                        product.availableQty
                                                            .toString(),
                                                        style: context.bodySmall
                                                            .secondaryColor,
                                                      ),
                                                    ),
                                                    DataCell(
                                                      Text(
                                                        "XAF ${product.sellingPrice.toInt()}",
                                                        style: context.bodySmall
                                                            .secondaryColor,
                                                      ),
                                                    ),
                                                    DataCell(
                                                      showEditIcon: true,
                                                      onTap: () {
                                                        'edit btn tapped'.log();
                                                      },
                                                      placeholder: true,
                                                      TextFormField(
                                                        initialValue: "1",
                                                        onChanged: (value) {
                                                          product =
                                                              product.copyWith(
                                                            orderQty: value
                                                                        .isEmpty ||
                                                                    int.parse(
                                                                            value) ==
                                                                        0
                                                                ? 1
                                                                : int.parse(
                                                                    value),
                                                          );
                                                          selectedItemsMap[product
                                                                  .productId] =
                                                              product;
                                                          // selectedItems[selectedItems
                                                          //     .indexWhere((element) =>
                                                          //         element
                                                          //             .productId ==
                                                          //         product
                                                          //             .productId)] = product;
                                                          ref
                                                              .read(
                                                                  totalPriceNotifierProvider
                                                                      .notifier)
                                                              .calculateTotalPrice(
                                                                selectedItemsMap
                                                                    .entries
                                                                    .map((e) =>
                                                                        e.value)
                                                                    .toList(),
                                                              );
                                                        },
                                                        onSaved: (newValue) {
                                                          product =
                                                              product.copyWith(
                                                            orderQty: newValue ==
                                                                        null ||
                                                                    newValue
                                                                        .isEmpty
                                                                ? 0
                                                                : int.parse(
                                                                    newValue),
                                                          );
                                                          selectedItems[selectedItems
                                                              .indexWhere((element) =>
                                                                  element
                                                                      .productId ==
                                                                  product
                                                                      .productId)] = product;
                                                        },
                                                        validator: (value) {
                                                          if (value == null ||
                                                              value.isEmpty ||
                                                              int.parse(
                                                                      value) ==
                                                                  0) {
                                                            return "Enter a value > 0";
                                                          } else if (int
                                                                  .tryParse(
                                                                      value) ==
                                                              null) {
                                                            return "Enter a valid number";
                                                          } else if (int
                                                                  .tryParse(
                                                                      value)! >
                                                              product
                                                                  .availableQty) {
                                                            return "Order quantity cannot be more than available quantity";
                                                          }
                                                          return null;
                                                        },
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        cursorColor: context
                                                            .colorScheme
                                                            .secondary,
                                                        inputFormatters: [
                                                          FilteringTextInputFormatter
                                                              .digitsOnly
                                                        ],
                                                        autovalidateMode:
                                                            AutovalidateMode
                                                                .onUserInteraction,
                                                      ),
                                                      // Text(
                                                      //   product.orderQty
                                                      //       .toString(),
                                                      // ),
                                                    ),
                                                  ],
                                                ),
                                            ],
                                          ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Total: XAF ${totalPrice.toInt()}",
                                        style: context.titleMedium.bold500),
                                    ref
                                        .watch(inventoryCrudNotifierProvider)
                                        .maybeWhen(
                                          orElse: () {
                                            return MainBtns(
                                              size: size,
                                              width: 250,
                                              onPressed: selectedItems.isEmpty
                                                  ? null
                                                  : () {
                                                      if (_formKey.currentState!
                                                          .validate()) {
                                                        _formKey.currentState!
                                                            .save();
                                                        ref
                                                            .read(
                                                                inventoryCrudNotifierProvider
                                                                    .notifier)
                                                            .addProductSale(
                                                                selectedItems);
                                                      }
                                                    },
                                              btnText: "Sell Items",
                                            );
                                          },
                                          loading: () => MainBtnLoading(
                                            size: size,
                                            width: 250,
                                          ),
                                        ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddSalesDataWidget extends ConsumerWidget {
  const AddSalesDataWidget(
      {super.key, required this.selectedItems, required this.products});

  final List<Product> selectedItems;
  final List<Product> products;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItemsMap = ref.watch(selectedItemsMapProvider);
    return DataTable2(
      columnSpacing: 80,
      horizontalMargin: 12,
      minWidth: 600,
      dividerThickness: 0.25,
      headingCheckboxTheme: context.theme.checkboxTheme,
      datarowCheckboxTheme: context.theme.checkboxTheme,
      onSelectAll: (value) {
        ref
            .read(itemsToSellNotifierProvider.notifier)
            .toggleAllSelection(products);
        ref.read(totalPriceNotifierProvider.notifier).calculateTotalPrice(
              ref
                  .watch(selectedItemsMapProvider)
                  .entries
                  .map((e) => e.value)
                  .toList(),
            );
      },
      columns: [
        DataColumn2(
          label: Text(
            'Product',
            style: context.bodySmall.secondaryColor.bold,
          ),
          size: ColumnSize.L,
        ),
        DataColumn2(
          label: Text(
            'Stock',
            style: context.bodySmall.secondaryColor.bold,
          ),
          size: ColumnSize.S,
          fixedWidth: 140,
        ),
        DataColumn2(
          label: Text(
            'Price',
            style: context.bodySmall.secondaryColor.bold,
          ),
        ),
        DataColumn2(
          label: Text(
            'Last Order Date',
            style: context.bodySmall.secondaryColor.bold,
          ),
        ),
      ],
      rows: [
        for (Product product in products)
          DataRow(
            selected: selectedItems.contains(product),
            onSelectChanged: (value) {
              ref
                  .read(itemsToSellNotifierProvider.notifier)
                  .toggleSelection(product);
              ref.read(totalPriceNotifierProvider.notifier).calculateTotalPrice(
                    selectedItemsMap.entries.map((e) => e.value).toList(),
                  );
            },
            cells: [
              DataCell(
                Text(
                  product.productName,
                  style: context.bodySmall.secondaryColor,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              DataCell(
                Text(
                  product.availableQty.toString(),
                  style: context.bodySmall.secondaryColor,
                ),
              ),
              DataCell(
                Text(
                  "XAF ${product.sellingPrice.toInt()}",
                  style: context.bodySmall.secondaryColor,
                ),
              ),
              DataCell(
                Text(
                  product.dateModified!.dateToString,
                  style: context.bodySmall.secondaryColor,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
