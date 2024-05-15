import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_manager/src/common/widgets/buttons.dart';
import 'package:stock_manager/src/features/inventory/domain/inventory_models.dart';
import 'package:stock_manager/src/features/inventory/presentation/view_models/inventory_providers.dart';
import 'package:stock_manager/src/features/inventory/presentation/widgets/product_status_widget.dart';
import 'package:stock_manager/src/utils/constants/constants.dart';
import 'package:stock_manager/src/utils/extensions/extensions.dart';

class InventoryScrn extends ConsumerWidget {
  const InventoryScrn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            // width: double.infinity,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: context.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(kCardRadius),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Inventory",
                          style: context.bodyLarge,
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
                    20.vGap,
                    SizedBox(
                      height: size.height * 0.75,
                      child: ref.watch(inventoryCrudNotifierProvider).when(
                        error: (error, stackTrace) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("An error occured loading products"),
                                TextButton.icon(
                                  onPressed: () {
                                    ref.invalidate(
                                        inventoryCrudNotifierProvider);
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
                              mainAxisAlignment: MainAxisAlignment.center,
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
                            minWidth: 1200,
                            dataRowHeight: 60,
                            dividerThickness: 0.25,
                            fixedLeftColumns: 1,
                            isHorizontalScrollBarVisible: true,
                            isVerticalScrollBarVisible: true,
                            columns: const [
                              DataColumn2(
                                label: Text('Product'),
                                size: ColumnSize.L,
                              ),
                              DataColumn2(
                                label: Text('Stock'),
                                // numeric: true,
                                size: ColumnSize.S,
                                fixedWidth: 120,
                              ),
                              DataColumn2(
                                label: Text('Price'),
                              ),
                              DataColumn2(
                                label: Text('Expiry Date'),
                              ),
                              DataColumn2(
                                label: Text('Status'),
                              ),
                              DataColumn2(
                                label: Text('Last Order Date'),
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
                                      ),
                                    ),
                                    DataCell(
                                      Text(product.availableQty.toString()),
                                    ),
                                    DataCell(
                                      Text(
                                          "XAF ${product.sellingPrice.toInt()}"),
                                    ),
                                    DataCell(
                                      Text(
                                        product.expiryDate!.dateToString,
                                      ),
                                    ),
                                    DataCell(
                                      ProductStatusWidget(product: product),
                                    ),
                                    DataCell(
                                      Text(
                                        product.expiryDate!.dateToString,
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          );
                        },
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
