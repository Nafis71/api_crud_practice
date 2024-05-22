import 'package:flutter/material.dart';

class ActionContainer extends StatelessWidget {
  final Function onPressedAction;
  final IconData icon;
  final Color color;
  const ActionContainer({super.key, required this.onPressedAction, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(10.00)
      ),
      alignment: Alignment.center,
      child: IconButton(
        onPressed: () => onPressedAction(),
        icon: Icon(
          icon,
          color: color,size: 25,
        ),
      ),
    );
  }
}
