import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_manager/src/common/widgets/buttons.dart';
import 'package:stock_manager/src/common/widgets/dropdowns.dart';
import 'package:stock_manager/src/common/widgets/text_form_fields.dart';
import 'package:stock_manager/src/features/home/presentation/widgets/dashboard_details_card.dart';
import 'package:stock_manager/src/features/inventory/domain/inventory_models.dart';
import 'package:stock_manager/src/features/inventory/presentation/view_models/inventory_providers.dart';
import 'package:stock_manager/src/features/inventory/presentation/widgets/product_status_widget.dart';
import 'package:stock_manager/src/utils/constants/constants.dart';
import 'package:stock_manager/src/utils/extensions/extensions.dart';

class InventoryScrn extends HookConsumerWidget {
  const InventoryScrn({super.key});
  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    final selectedFilterDuration = ref.watch(generalDurationCode);
    FocusNode focusNode = useFocusNode();
    final size = MediaQuery.sizeOf(context);
    final searchFieldIsActive = ref.watch(isSearchFieldActiveProvider);
    final searchedProds = ref.watch(searchProductsNotifierProvider);
    focusNode.addListener(() {
      if (focusNode.hasFocus && !searchFieldIsActive) {
        ref.read(isSearchFieldActiveProvider.notifier).state =
            focusNode.hasFocus;
      }
    });
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: context.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(kCardRadius),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Inventory Summary",
                          style: context.titleMedium.bold,
                        ),
                        12.hGap,
                        Expanded(
                          child: FilterInventoryCardDropdown(
                            selectedDurationCode: selectedFilterDuration,
                          ),
                        ),
                      ],
                    ),
                    8.vGap,
                    Row(
                      children: [
                        Expanded(
                          child: DashboardDetailsCard(
                            label: "Total Products",
                            value: "",
                            subTitle: "Products: ",
                            provider: ref.watch(getTotalProductsProvider(
                                selectedFilterDuration)),
                            providerHasTwoOutputs: true,
                            providerOutputIndex: 2,
                          ),
                        ),
                        4.hGap,
                        Expanded(
                          child: DashboardDetailsCard(
                            label: "Available Stock",
                            value: "",
                            subTitle: "Items: ",
                            provider: ref.watch(getTotalProductsProvider(
                                selectedFilterDuration)),
                            providerHasTwoOutputs: true,
                          ),
                        ),
                        4.hGap,
                        Expanded(
                          child: DashboardDetailsCard(
                            label: 'Low Stock',
                            value: '4',
                            subTitle: 'Products: ',
                            provider: ref.watch(getLowStockCountProvider(
                                selectedFilterDuration)),
                          ),
                        ),
                      ],
                    ),
                    12.vGap,
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: context.colorScheme.primary,
                        borderRadius: BorderRadius.circular(kCardRadius),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Inventory Items",
                              style: context.titleMedium.bold,
                            ),
                            8.vGap,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: size.width * 0.3,
                                  child: CustomInputFormField(
                                    hintText: "Search Product",
                                    controller: searchController,
                                    focusNode: focusNode,
                                    onSubmitted: (p0) {
                                      'submitted with value $p0'.log();
                                      ref
                                          .read(searchProductsNotifierProvider
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
                                          .read(searchQueryProvider.notifier)
                                          .update((state) => value);
                                      ref.read(filteredProductNamesProvider);
                                    },
                                    onClear: () {
                                      searchController.clear();
                                      focusNode.unfocus();
                                      ref
                                          .read(isSearchFieldActiveProvider
                                              .notifier)
                                          .state = false;
                                      ref
                                          .read(searchQueryProvider.notifier)
                                          .update((state) => '');
                                      ref
                                          .read(filteredProductNamesProvider
                                              .notifier)
                                          .state = [];
                                    },
                                  ),
                                ),
                                MainBtns(
                                  size: size,
                                  flexWidth: true,
                                  prefixIcon: Icons.add,
                                  onPressed: () {
                                    context.go('/add_sales');
                                  },
                                  btnText: "Add Sale",
                                ),
                              ],
                            ),
                            8.vGap,
                            SizedBox(
                              // height: size.height * 0.65,
                              height: size.height - 310,
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
                                                          searchFullText: true);
                                                  searchController.text = e;
                                                  'searching for $e'.log();
                                                  focusNode.unfocus();
                                                  ref
                                                      .read(
                                                          isSearchFieldActiveProvider
                                                              .notifier)
                                                      .state = focusNode.hasFocus;
                                                },
                                                title: Text(e),
                                                trailing: Icon(
                                                  Icons.arrow_outward_rounded,
                                                  color: context
                                                      .colorScheme.secondary,
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
                                            return const ProductsErrorWidget();
                                          },
                                          loading: () {
                                            return const LoadingProductsWidget();
                                          },
                                          data: (products) {
                                            return Column(
                                              children: [
                                                Expanded(
                                                  child:
                                                      FetchProductsDataWidget(
                                                    products: products,
                                                  ),
                                                ),
                                                // PaginationWidget(size: size),
                                              ],
                                            );
                                          },
                                        )
                                      : ref
                                          .watch(inventoryCrudNotifierProvider)
                                          .when(
                                          error: (error, stackTrace) {
                                            return const ProductsErrorWidget();
                                          },
                                          loading: () {
                                            return const LoadingProductsWidget();
                                          },
                                          data: (products) {
                                            return Column(
                                              children: [
                                                Expanded(
                                                  child:
                                                      FetchProductsDataWidget(
                                                    products: products,
                                                  ),
                                                ),
                                                // PaginationWidget(size: size),
                                              ],
                                            );
                                          },
                                        ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FetchProductsDataWidget extends StatelessWidget {
  const FetchProductsDataWidget({
    super.key,
    required this.products,
  });
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return DataTable2(
      columnSpacing: 80,
      horizontalMargin: 12,
      minWidth: 1200,
      dataRowHeight: 45,
      dividerThickness: 0.25,
      fixedLeftColumns: 1,
      isHorizontalScrollBarVisible: true,
      isVerticalScrollBarVisible: true,
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
          // numeric: true,
          size: ColumnSize.S,
          fixedWidth: 120,
        ),
        DataColumn2(
          label: Text(
            'Price',
            style: context.bodySmall.secondaryColor.bold,
          ),
        ),
        DataColumn2(
          label: Text(
            'Expiry Date',
            style: context.bodySmall.secondaryColor.bold,
          ),
        ),
        DataColumn2(
          label: Text(
            'Status',
            style: context.bodySmall.secondaryColor.bold,
          ),
        ),
        DataColumn2(
          label: Text(
            'Added On',
            style: context.bodySmall.secondaryColor.bold,
          ),
        ),
      ],
      rows: [
        for (Product product in products)
          DataRow(
            cells: [
              DataCell(
                Text(
                  product.productName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.bodySmall.secondaryColor,
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
                  product.expiryDate!.dateToString,
                  style: context.bodySmall.secondaryColor,
                ),
              ),
              DataCell(
                ProductStatusWidget(product: product),
              ),
              DataCell(
                Text(
                  product.dateAdded!.dateTimeToString,
                  style: context.bodySmall.secondaryColor,
                ),
              ),
            ],
          ),
      ],
    );
  }
}

class LoadingProductsWidget extends StatelessWidget {
  const LoadingProductsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Fetching Products"),
          8.vGap,
          CircularProgressIndicator.adaptive(
            backgroundColor: context.colorScheme.secondary,
          ),
        ],
      ),
    );
  }
}

class ProductsErrorWidget extends ConsumerWidget {
  const ProductsErrorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("An error occured loading products"),
          TextButton.icon(
            onPressed: () {
              ref.invalidate(inventoryCrudNotifierProvider);
            },
            icon: const Icon(Icons.refresh),
            label: const Text("Refresh"),
          ),
        ],
      ),
    );
  }
}
