import 'package:flutter/material.dart';

class CustomIconButton extends StatefulWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.size,
  });
  final IconData icon;
  final Function() onPressed;
  final double size;

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        widget.icon,
        size: widget.size,
      ),
      onPressed: widget.onPressed,
      color: Colors.white,
      //iconSize: widget.size,
    );
  }
}
