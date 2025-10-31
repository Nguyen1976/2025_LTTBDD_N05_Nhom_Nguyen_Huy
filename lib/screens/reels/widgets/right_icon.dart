import 'package:flutter/material.dart';

class RightIconButton extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback onTap;
  final Color iconColor;

  const RightIconButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.iconColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(30),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6.0,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
              child: Image.network(icon, color: iconColor, fit: BoxFit.cover),
            ),
          ),
        ),
        const SizedBox(height: 6),
        label.isNotEmpty
            ? Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  shadows: [
                    Shadow(
                      blurRadius: 4,
                      color: Colors.black87,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
