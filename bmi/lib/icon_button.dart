import 'package:flutter/material.dart';

class IconButton extends StatelessWidget {
  final IconData icon;
  final Function() onPress;
  const IconButton(
    this.icon,
    this.onPress, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      elevation: 2.0,
      constraints: const BoxConstraints(
        minWidth: 50.0, minHeight: 50.0),
      fillColor: const Color(0xFF4C4F5E),
      padding: const EdgeInsets.all(16.0),
      shape: const CircleBorder(),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
