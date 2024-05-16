import 'package:flutter/material.dart';
import 'package:stock_manager/src/utils/extensions/extensions.dart';

class DashboardDetailsCard extends StatelessWidget {
  const DashboardDetailsCard({
    super.key,
    required this.label,
    required this.value,
    required this.subTitle,
  });
  final String label;
  final String value;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: context.colorScheme.primary,
        ),
        color: context.colorScheme.primary,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: context.bodyLarge,
            ),
            8.vGap,
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Total: ",
                    style: context.bodyLarge,
                  ),
                  TextSpan(
                    text: value,
                    style: context.titleMedium.bold,
                  ),
                  TextSpan(
                    text: subTitle,
                    style: context.bodyLarge,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
