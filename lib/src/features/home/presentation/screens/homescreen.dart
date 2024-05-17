import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_manager/src/features/add_sales/presentation/screens/sales_scrn.dart';
import 'package:stock_manager/src/features/home/presentation/screens/dashboard.dart';
import 'package:stock_manager/src/features/home/presentation/view_models/home_providers.dart';
import 'package:stock_manager/src/features/home/presentation/widgets/home_drawer_list_tile.dart';
import 'package:stock_manager/src/features/inventory/presentation/screens/inventory_scrn.dart';
import 'package:stock_manager/src/utils/extensions/extensions.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final size = MediaQuery.sizeOf(context);
    final currentTab = ref.watch(selectedTabProvider);
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
                        isSelected: currentTab == 0,
                        onTap: () {
                          ref
                              .read(selectedTabProvider.notifier)
                              .update((state) => 0);
                        },
                      ),
                      HomeDrawerListTile(
                        title: "Sales",
                        icon: Icons.production_quantity_limits_outlined,
                        isSelected: currentTab == 1,
                        onTap: () {
                          ref
                              .read(selectedTabProvider.notifier)
                              .update((state) => 1);
                        },
                      ),
                      HomeDrawerListTile(
                        title: "Inventory Management",
                        icon: Icons.inventory_outlined,
                        isSelected: currentTab == 2,
                        onTap: () {
                          ref
                              .read(selectedTabProvider.notifier)
                              .update((state) => 2);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // 50.hGap,
            Expanded(
              // child: InventoryScrn(),
              child: switch (currentTab) {
                0 => const DashboardScrn(),
                1 => const SalesScrn(),
                2 => InventoryScrn(),
                _ => const DashboardScrn(),
              },
            ),
            // 50.hGap,
            const SizedBox(
              width: 4,
            )
          ],
        ),
      ),
    );
  }
}
