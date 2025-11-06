import 'package:flutter/material.dart';
import 'package:instargram/models/reel_item.dart';
import 'right_icon.dart';

class RightActionColumn extends StatelessWidget {
  final ReelItem item;
  final bool liked;
  final VoidCallback onToggleLike;
  final VoidCallback onShowComments;

  const RightActionColumn({
    required this.item,
    required this.liked,
    required this.onToggleLike,
    required this.onShowComments,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RightIconButton(
          icon: liked
              ? 'https://img.icons8.com/color/48/hearts.png'
              : 'https://img.icons8.com/ios/50/hearts--v1.png',
          label: formatCount(item.likes),
          onTap: onToggleLike,
          iconColor: liked ? Colors.pinkAccent : Colors.white,
        ),
        const SizedBox(height: 18),
        RightIconButton(
          icon: 'https://img.icons8.com/ios/50/speech-bubble--v1.png',
          label: formatCount(item.comments),
          onTap: onShowComments,
        ),
        const SizedBox(height: 18),
        RightIconButton(
          icon: 'https://img.icons8.com/material-rounded/24/repeat.png',
          label: formatCount(item.shares),
          onTap: () {},
        ),
        const SizedBox(height: 18),
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(item.userAvatar),
        ),
      ],
    );
  }
}

String formatCount(int count) {
  if (count >= 1000000) return '${(count / 1000000).toStringAsFixed(1)}M';
  if (count >= 1000) return '${(count / 1000).toStringAsFixed(1)}K';
  return count.toString();
}
