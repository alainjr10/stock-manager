import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_manager/src/common/widgets/buttons.dart';
import 'package:stock_manager/src/features/home/presentation/widgets/home_drawer_list_tile.dart';
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
                          child: Row(
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
                                onPressed: () {},
                                btnText: "Add Sale",
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
