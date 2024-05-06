import 'package:flutter/material.dart';
import 'package:stock_manager/src/utils/constants/constants.dart';
import 'package:stock_manager/src/utils/extensions/extensions.dart';

class MainBtns extends StatelessWidget {
  const MainBtns({
    super.key,
    required this.size,
    this.backgroundColor,
    this.foregroundColor,
    this.borderSideColor,
    required this.onPressed,
    required this.btnText,
    this.prefixIcon,
    this.width,
    this.flexWidth = false,
    this.height,
    this.loadingState = false,
    this.btnTextStyle,
    this.buttonPadding,
  });

  final Size size;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderSideColor;
  final String btnText;
  final IconData? prefixIcon;
  final double? width;
  final bool flexWidth;
  final double? height;
  final Function()? onPressed;
  final bool loadingState;
  final TextStyle? btnTextStyle;
  final EdgeInsets? buttonPadding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          textStyle: btnTextStyle ?? kBtnTextStyle,
          backgroundColor: loadingState
              ? backgroundColor == null
                  ? kSecondaryColor.withOpacity(0.5)
                  : backgroundColor!.withOpacity(0.5)
              : backgroundColor,
          foregroundColor: foregroundColor ?? context.colorScheme.onSecondary,
          fixedSize: flexWidth
              ? Size.fromHeight(height ?? 45.0)
              : Size(width ?? size.width, height ?? 45.0),
          padding: buttonPadding,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(kBtnRadius),
            ),
          ),
          side: BorderSide(color: borderSideColor ?? kSecondaryColor)),
      child: loadingState
          ? const SizedBox(
              width: 25.0,
              height: 25.0,
              child: CircularProgressIndicator(color: kSecondaryColor))
          : prefixIcon == null
              ? Text(
                  btnText,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  // style: btnTextStyle,
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      prefixIcon,
                      color: foregroundColor ?? context.colorScheme.onSecondary,
                    ),
                    2.hGap,
                    Text(
                      btnText,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      // style: btnTextStyle,
                    ),
                  ],
                ),
    );
  }
}

class MainBtnLoading extends StatelessWidget {
  const MainBtnLoading({
    super.key,
    required this.size,
    this.width,
    this.flexWidth = false,
  });
  final Size size;
  final double? width;
  final bool? flexWidth;

  @override
  Widget build(BuildContext context) {
    return MainBtns(
      size: size,
      width: width ?? size.width,
      loadingState: true,
      flexWidth: false,
      backgroundColor: kSecondaryColor,
      foregroundColor: kPrimaryColor,
      borderSideColor: kPrimaryColor,
      btnText: '',
      onPressed: () {},
    );
  }
}

class MainBtnsNull extends StatelessWidget {
  const MainBtnsNull(
      {super.key, required this.size, this.width, required this.btnText});
  final Size size;
  final double? width;
  final String btnText;

  @override
  Widget build(BuildContext context) {
    return MainBtns(
      size: size,
      width: width,
      loadingState: false,
      backgroundColor: kSecondaryColor,
      foregroundColor: kPrimaryColor,
      borderSideColor: kPrimaryColor,
      btnText: btnText,
      onPressed: null,
    );
  }
}
