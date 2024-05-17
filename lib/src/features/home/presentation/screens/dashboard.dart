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

class DashboardScrn extends HookConsumerWidget {
  const DashboardScrn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    final selectedFilterDuration = ref.watch(generalDurationCode);
    final size = MediaQuery.sizeOf(context);
    // 'height is ${size.height} and width is ${size.width}'.log();
    return SingleChildScrollView(
      padding: const EdgeInsets.all(50),
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
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "Dashboard Summary",
                            style: context.titleLarge,
                          ),
                        ),
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
                            label: "Stock Sold",
                            value: "",
                            subTitle: "Items: ",
                            provider: ref.watch(getSoldProductsProvider(
                                selectedFilterDuration)),
                            providerHasTwoOutputs: true,
                          ),
                        ),
                        4.hGap,
                        Expanded(
                          child: DashboardDetailsCard(
                            label: "Total Sales",
                            value: "",
                            subTitle: "XAF ",
                            provider: ref.watch(
                                getSalesValueProvider(selectedFilterDuration)),
                          ),
                        ),
                        4.hGap,
                        Expanded(
                          child: DashboardDetailsCard(
                            label: 'Available Stock',
                            value: '',
                            subTitle: 'Items: ',
                            provider: ref.watch(getTotalProductsProvider(
                                selectedFilterDuration)),
                            providerHasTwoOutputs: true,
                          ),
                        ),
                      ],
                    ),
                    16.vGap,
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
                              style: context.titleLarge,
                            ),
                            8.vGap,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: size.width * 0.25,
                                  child: CustomInputFormField(
                                    hintText: "Search Product",
                                    controller: searchController,
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
                            20.vGap,
                            SizedBox(
                              // height: size.height * 0.65,
                              height: size.height - 445,
                              child:
                                  ref.watch(inventoryCrudNotifierProvider).when(
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
                                              Text(product.availableQty
                                                  .toString()),
                                            ),
                                            DataCell(
                                              Text(
                                                  "XAF ${product.sellingPrice.toInt()}"),
                                            ),
                                            DataCell(
                                              Text(
                                                product
                                                    .expiryDate!.dateToString,
                                              ),
                                            ),
                                            DataCell(
                                              ProductStatusWidget(
                                                  product: product),
                                            ),
                                            DataCell(
                                              Text(
                                                product
                                                    .expiryDate!.dateToString,
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
