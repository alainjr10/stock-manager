import 'package:flutter/material.dart';
import 'package:stock_manager/src/common/widgets/buttons.dart';

class PaginationWidget extends StatelessWidget {
  const PaginationWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MainBtns(
          size: size,
          flexWidth: true,
          prefixIcon: Icons.arrow_back_ios_new,
          onPressed: () {},
          btnText: "Prev",
          buttonPadding: const EdgeInsets.symmetric(horizontal: 8),
        ),
        ...List.generate(10, (index) => ++index).map(
          (e) {
            return TextButton(
              onPressed: () {},
              child: Text(
                e.toString(),
              ),
            );
          },
        ),
        MainBtns(
          size: size,
          flexWidth: true,
          prefixIcon: Icons.arrow_forward_ios,
          buttonPadding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          iconIsTrailing: true,
          onPressed: () {},
          btnText: "Next",
        ),
      ],
    );
  }
}
