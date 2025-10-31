import 'package:flutter/material.dart';
import 'package:instargram/screens/reels/models/reel_item.dart';

class ReelFooter extends StatelessWidget {
  final ReelItem item;

  const ReelFooter({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 12,
      bottom: 28,
      right: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(item.userAvatar),
              ),
              const SizedBox(width: 8),
              Text(
                item.userName,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Theo dõi',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            item.caption,
            style: const TextStyle(color: Colors.white),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
