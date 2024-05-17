import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stock_manager/src/utils/extensions/extensions.dart';

class DashboardDetailsCard extends ConsumerWidget {
  const DashboardDetailsCard({
    super.key,
    required this.label,
    required this.value,
    required this.subTitle,
    required this.provider,
    this.providerHasTwoOutputs = false,
    this.providerOutputIndex = 1,
  });
  final String label;
  final String value;
  final String subTitle;
  final AsyncValue provider;
  final bool providerHasTwoOutputs;
  final int providerOutputIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            provider.maybeWhen(
              data: (data) {
                String val;
                if (providerHasTwoOutputs) {
                  val = switch (providerOutputIndex) {
                    1 => data.$1.toString(),
                    2 => data.$2.toString(),
                    _ => data.toString(),
                  };
                } else {
                  val = data.toString();
                }
                return Text(
                  '$subTitle$val',
                  style: context.titleMedium.bold700,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                );
              },
              loading: () {
                return const CardDataLoadingShimmer();
              },
              orElse: () => const Text("0"),
            ),
            // Text.rich(
            //   TextSpan(
            //     children: [
            //       TextSpan(
            //         text: "Total: ",
            //         style: context.bodyLarge,
            //       ),
            //       TextSpan(
            //         text: value,
            //         style: context.titleMedium.bold,
            //       ),
            //        provider.maybeWhen(
            //     data: (data) {
            //       return Text(
            //         '$value${providerHasTwoOutputs ? data.$1.toString() : data.toString()}',
            //         style: context.titleMedium.bold700,
            //         maxLines: 1,
            //         overflow: TextOverflow.ellipsis,
            //       );
            //     },
            //     loading: () {
            //       return const CardDataLoadingShimmer();
            //     },
            //     orElse: () => const Text("0"),
            //   ),
            //       TextSpan(
            //         text: subTitle,
            //         style: context.bodyLarge,
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

class CardDataLoadingShimmer extends StatelessWidget {
  const CardDataLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Opacity(
        opacity: 0.8,
        child: Shimmer.fromColors(
          baseColor: Colors.black12,
          highlightColor: Colors.white,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Loading',
                style: context.titleMedium.bold700,
              )
            ],
          ),
        ),
      ),
    );
  }
}
