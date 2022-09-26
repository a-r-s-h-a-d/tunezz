import 'package:flutter/material.dart';

class CustomIconButton extends StatefulWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });
  final IconData icon;
  final Function() onPressed;

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(widget.icon),
      onPressed: widget.onPressed,
      color: Colors.white,
      iconSize: 35,
    );
  }
}
