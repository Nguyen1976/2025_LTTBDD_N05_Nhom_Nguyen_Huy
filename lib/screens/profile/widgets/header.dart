import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Text(
                'nguyenn_535',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 6),
              const Icon(Icons.arrow_drop_down, color: Colors.black),
            ],
          ),
        ),
        Row(
          children: const [
            Icon(Icons.currency_exchange_outlined, color: Colors.black),
            SizedBox(width: 12),
            Icon(Icons.add_box_outlined, color: Colors.black),
            SizedBox(width: 12),
            Icon(Icons.menu, color: Colors.black),
          ],
        ),
      ],
    );
  }
}
