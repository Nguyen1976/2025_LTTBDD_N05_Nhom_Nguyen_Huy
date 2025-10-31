import 'package:flutter/material.dart';

class BigHeartAnimation extends StatelessWidget {
  final bool show;

  const BigHeartAnimation({required this.show, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedScale(
        scale: show ? 1.0 : 0.6,
        duration: const Duration(milliseconds: 300),
        curve: Curves.elasticOut,
        child: AnimatedOpacity(
          opacity: show ? 1 : 0,
          duration: const Duration(milliseconds: 200),
          child: Icon(
            Icons.favorite,
            size: 120,
            color: Colors.red.withOpacity(0.85),
          ),
        ),
      ),
    );
  }
}
