import 'package:flutter/material.dart';

class ButtonContainedWidget extends StatelessWidget {
  //required
  final void Function()? onPressed;
  final String label;

  //optional
  final bool? isDisable;
  final double? width;
  final double? height;
  final Widget? icon;

  const ButtonContainedWidget({
    super.key,
    required this.onPressed,
    required this.label,
    this.isDisable,
    this.width,
    this.height = 30,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    void Function()? onPressdFunction = isDisable == true ? null : onPressed;

    ButtonStyle? buttonStyle;

    return SizedBox(
      width: width,
      height: height,
      child: (icon != null)
          ? ElevatedButton.icon(
              onPressed: onPressdFunction,
              icon: icon!,
              label: Text(label),
              style: buttonStyle,
            )
          : ElevatedButton(
              onPressed: onPressdFunction,
              style: buttonStyle,
              child: Text(label),
            ),
    );
  }
}
