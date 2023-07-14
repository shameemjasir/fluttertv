import 'package:flutter/material.dart';

class IconButtonSection extends StatelessWidget {
  void Function() onPressed;
  double size;
  IconData icon;

  IconButtonSection(
      {super.key,
      required this.onPressed,
      required this.size,
      required this.icon});

  @override
  Widget build(BuildContext context) => IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: Colors.blue,
        size: size,
      ));
}
