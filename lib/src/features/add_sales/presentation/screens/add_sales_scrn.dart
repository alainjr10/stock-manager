import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_manager/src/common/widgets/buttons.dart';
import 'package:stock_manager/src/features/add_sales/presentation/view_models/add_sales_providers.dart';
import 'package:stock_manager/src/features/inventory/domain/product_model.dart';
import 'package:stock_manager/src/features/inventory/presentation/view_models/inventory_providers.dart';
import 'package:stock_manager/src/utils/constants/constants.dart';
import 'package:stock_manager/src/utils/extensions/extensions.dart';

class AddSalesScreen extends ConsumerStatefulWidget {
  const AddSalesScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddSalesScreenState();
}

class _AddSalesScreenState extends ConsumerState<AddSalesScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final selectedItems = ref.watch(itemsToSellNotifierProvider);
    double totalPrice = 0;
    totalPrice = selectedItems.fold<double>(
        totalPrice,
        (previousValue, element) =>
            previousValue + element.sellingPrice * element.orderQty);
    // 'width is ${size.width}'.log();
    ref.listen(addSalesNotifierProvider, (_, state) {
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
        padding: const EdgeInsets.all(24),
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
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Select the item(s) you want to sell",
                                style: context.headlineSmall.bold500,
                              ),
                              20.vGap,
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      cursorColor:
                                          context.colorScheme.secondary,
                                      decoration: InputDecoration(
                                        hintText: "Search for a product",
                                        prefixIcon: const Icon(
                                          Icons.search,
                                        ),
                                        suffixIcon: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.close),
                                        ),
                                        prefixIconColor: context
                                            .colorScheme.secondary
                                            .withOpacity(0.7),
                                        suffixIconColor:
                                            context.colorScheme.secondary,
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          borderSide: BorderSide(
                                            width: 0.4,
                                            color:
                                                context.colorScheme.secondary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: SizedBox(
                                  // height: 200,
                                  child: ref
                                      .watch(getInventoryProductsProvider)
                                      .when(
                                    error: (error, stackTrace) {
                                      return Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                                "An error occured loading products"),
                                            TextButton.icon(
                                              onPressed: () {
                                                ref.invalidate(
                                                    getInventoryProductsProvider);
                                              },
                                              icon: const Icon(Icons.refresh),
                                              label: const Text("Refresh"),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    loading: () {
                                      return Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text("Fetching Products"),
                                            8.vGap,
                                            CircularProgressIndicator.adaptive(
                                              backgroundColor:
                                                  context.colorScheme.secondary,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    data: (products) {
                                      return DataTable2(
                                        columnSpacing: 80,
                                        horizontalMargin: 12,
                                        minWidth: 600,
                                        dividerThickness: 0.25,
                                        headingCheckboxTheme:
                                            context.theme.checkboxTheme,
                                        datarowCheckboxTheme:
                                            context.theme.checkboxTheme,
                                        onSelectAll: (value) {
                                          ref
                                              .read(itemsToSellNotifierProvider
                                                  .notifier)
                                              .toggleAllSelection(products);
                                        },
                                        columns: const [
                                          DataColumn2(
                                            label: Text('Product'),
                                          ),
                                          DataColumn(
                                            label: Text('Available Qty'),
                                            numeric: true,
                                          ),
                                          DataColumn(
                                            label: Text('Price'),
                                          ),
                                          DataColumn(
                                            label: Text('Last Order Date'),
                                          ),
                                        ],
                                        rows: [
                                          for (Product product in products)
                                            DataRow(
                                              selected: selectedItems
                                                  .contains(product),
                                              onSelectChanged: (value) {
                                                ref
                                                    .read(
                                                        itemsToSellNotifierProvider
                                                            .notifier)
                                                    .toggleSelection(product);
                                              },
                                              cells: [
                                                DataCell(
                                                  Text(product.productName),
                                                ),
                                                DataCell(
                                                  Text(product.availableQty
                                                      .toString()),
                                                ),
                                                DataCell(
                                                  Text(
                                                      "XAF ${product.sellingPrice.toInt()}"),
                                                ),
                                                DataCell(
                                                  Text(product.dateModified!
                                                      .dateToString),
                                                ),
                                              ],
                                            ),
                                        ],
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Selected Items",
                                style: context.headlineSmall.bold500,
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
                                          columns: const [
                                            DataColumn2(
                                              label: Text('Product'),
                                            ),
                                            DataColumn(
                                              label: Text('Available Qty'),
                                              numeric: true,
                                            ),
                                            DataColumn(
                                              label: Text('Price'),
                                            ),
                                            DataColumn(
                                              label: Text('Order Qty'),
                                            ),
                                          ],
                                          rows: [
                                            for (Product product
                                                in selectedItems)
                                              DataRow(
                                                cells: [
                                                  DataCell(
                                                    Text(product.productName),
                                                  ),
                                                  DataCell(
                                                    Text(product.availableQty
                                                        .toString()),
                                                  ),
                                                  DataCell(
                                                    Text(
                                                        "XAF ${product.sellingPrice.toInt()}"),
                                                  ),
                                                  DataCell(showEditIcon: true,
                                                      onTap: () {
                                                    'edit btn tapped'.log();
                                                  },
                                                      placeholder: true,
                                                      TextFormField()
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
                                      style: context.headlineSmall.bold500),
                                  ref.watch(addSalesNotifierProvider).maybeWhen(
                                        orElse: () {
                                          return MainBtns(
                                            size: size,
                                            width: 250,
                                            onPressed: selectedItems.isEmpty
                                                ? null
                                                : () {
                                                    ref
                                                        .read(
                                                            addSalesNotifierProvider
                                                                .notifier)
                                                        .sellItems(
                                                            selectedItems);
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
