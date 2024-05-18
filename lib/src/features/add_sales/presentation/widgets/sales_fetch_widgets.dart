import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_manager/src/utils/extensions/extensions.dart';

class SalesLoadingWidget extends StatelessWidget {
  const SalesLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Fetching Products"),
          8.vGap,
          CircularProgressIndicator.adaptive(
            backgroundColor: context.colorScheme.secondary,
          ),
        ],
      ),
    );
  }
}

class SalesErrorWidget extends ConsumerWidget {
  const SalesErrorWidget({
    super.key,
    required this.invalidateProvider,
  });
  final ProviderOrFamily invalidateProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("An error occured loading products"),
          TextButton.icon(
            onPressed: () {
              ref.invalidate(invalidateProvider);
            },
            icon: const Icon(Icons.refresh),
            label: const Text("Refresh"),
          ),
        ],
      ),
    );
  }
}
