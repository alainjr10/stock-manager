import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_manager/src/common/widgets/buttons.dart';
import 'package:stock_manager/src/features/home/presentation/widgets/home_drawer_list_tile.dart';
import 'package:stock_manager/src/features/inventory/domain/inventory_models.dart';
import 'package:stock_manager/src/features/inventory/presentation/view_models/inventory_providers.dart';
import 'package:stock_manager/src/utils/constants/constants.dart';
import 'package:stock_manager/src/utils/extensions/extensions.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 300,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.fromBorderSide(
                    BorderSide(color: context.colorScheme.primaryContainer),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                        ),
                        child: Text(
                          "Inventory Manager",
                          style: context.headlineMedium.bold,
                        ),
                      ),
                      16.vGap,
                      HomeDrawerListTile(
                        title: "Dashboard",
                        icon: Icons.dashboard_outlined,
                        isSelected: true,
                        onTap: () {},
                      ),
                      HomeDrawerListTile(
                        title: "Sales",
                        icon: Icons.production_quantity_limits_outlined,
                        onTap: () {},
                      ),
                      HomeDrawerListTile(
                        title: "Products",
                        icon: Icons.inventory_2_outlined,
                        onTap: () {},
                      ),
                      HomeDrawerListTile(
                        title: "Inventory Management",
                        icon: Icons.inventory_outlined,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // 50.hGap,
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                height: size.height * 0.8,
                                child: ref
                                    .watch(inventoryCrudNotifierProvider)
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
                                          label: Text('Last Order Date'),
                                        ),
                                      ],
                                      rows: [
                                        for (Product product in products)
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
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // 50.hGap,
            const SizedBox(
              width: 400,
            )
          ],
        ),
      ),
    );
  }
}
