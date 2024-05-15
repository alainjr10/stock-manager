import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_manager/src/features/inventory/domain/inventory_models.dart';
import 'package:stock_manager/src/features/inventory/presentation/view_models/inventory_providers.dart';
import 'package:stock_manager/src/utils/extensions/extensions.dart';

class ProductStatusWidget extends ConsumerWidget {
  const ProductStatusWidget({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statusProvider = ref.watch(productStatusProvider(product: product));
    final statusColor = switch (statusProvider.$2) {
      0 => Colors.green,
      1 => Colors.red,
      2 => Colors.amber,
      _ => Colors.green,
    };

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.circle,
          size: 12,
          color: statusColor,
        ),
        4.hGap,
        Text(
          statusProvider.$1,
          style: context.bodyMedium.copyWith(color: statusColor),
        ),
      ],
    );
  }
}
