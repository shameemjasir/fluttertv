import 'package:flutter/material.dart';

class IconButtonSection extends StatelessWidget {
  void Function() onPressed;
  double size;
  IconData icon;
  Color iconColor;

  IconButtonSection({
    super.key,
    required this.onPressed,
    required this.size,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) => IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: iconColor,
        size: size,
      ));
}
