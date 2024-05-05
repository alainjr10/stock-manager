import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_manager/src/utils/extensions/extensions.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
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
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    'Home Screen',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeDrawerListTile extends StatelessWidget {
  const HomeDrawerListTile({
    super.key,
    required this.title,
    this.onTap,
    required this.icon,
    this.isSelected = false,
  });
  final String title;
  final Function()? onTap;
  final IconData icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(
        icon,
        color: context.colorScheme.onPrimary,
      ),
      onTap: onTap,
      selectedColor: context.colorScheme.onPrimary,
      selectedTileColor: context.colorScheme.primaryContainer,
      selected: isSelected,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
