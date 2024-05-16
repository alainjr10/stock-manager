import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_manager/src/features/inventory/presentation/view_models/inventory_providers.dart';
import 'package:stock_manager/src/utils/extensions/extensions.dart';

class FilterInventoryCardDropdown extends ConsumerWidget {
  const FilterInventoryCardDropdown({
    super.key,
    required this.selectedDurationCode,
  });

  final int selectedDurationCode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 160,
          height: 40,
          child: DropdownButtonFormField(
            items: List.generate(8, (index) => index)
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e.durationCodeString,
                      style: context.bodyMedium.secondaryColor.bold600,
                    ),
                  ),
                )
                .toList(),
            value: selectedDurationCode,
            onChanged: (value) {
              ref.read(generalDurationCode.notifier).update((state) {
                state = value!;
                return state;
              });
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: context.colorScheme.primary,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: context.theme.disabledColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: context.colorScheme.onPrimaryContainer,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 4,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
