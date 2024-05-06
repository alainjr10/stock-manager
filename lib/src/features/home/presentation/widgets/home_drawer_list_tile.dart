import 'package:flutter/material.dart';
import 'package:stock_manager/src/utils/extensions/extensions.dart';

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
