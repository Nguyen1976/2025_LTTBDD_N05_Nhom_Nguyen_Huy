import 'package:flutter/material.dart';
import 'package:instargram/screens/reels/widgets/big_heart_animation.dart';
import 'package:instargram/screens/reels/widgets/comments_sheet.dart';
import 'package:instargram/screens/reels/widgets/reel_footer.dart';
import 'package:instargram/screens/reels/widgets/right_action_column.dart';
import 'package:instargram/screens/reels/widgets/video_background.dart';
import 'package:video_player/video_player.dart';
import '../../../models/reel_item.dart';

class ReelPage extends StatefulWidget {
  final ReelItem item;
  final bool liked;
  final VoidCallback onToggleLike;
  final VideoPlayerController? videoController;

  const ReelPage({
    required this.item,
    required this.liked,
    required this.onToggleLike,
    this.videoController,
    super.key,
  });

  @override
  State<ReelPage> createState() => _ReelPageState();
}

class _ReelPageState extends State<ReelPage>
    with SingleTickerProviderStateMixin {
  bool _showBigHeart = false;
  late final AnimationController _heartCtrl;

  @override
  void initState() {
    super.initState();
    _heartCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    _heartCtrl.dispose();
    super.dispose();
  }

  void _onDoubleTap() {
    widget.onToggleLike();
    setState(() => _showBigHeart = true);
    _heartCtrl
        .forward(from: 0)
        .then((_) => Future.delayed(const Duration(milliseconds: 300)))
        .then((_) {
          if (mounted) setState(() => _showBigHeart = false);
        });
  }

  void _togglePlayPause() {
    final c = widget.videoController;
    if (c == null || !c.value.isInitialized) return;
    c.value.isPlaying ? c.pause() : c.play();
    setState(() {});
  }

  void _showComments() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => CommentsSheet(commentsList: widget.item.commentsList, reelId: widget.item.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;

    return GestureDetector(
      onTap: _togglePlayPause,
      onDoubleTap: _onDoubleTap,
      child: Stack(
        fit: StackFit.expand,
        children: [
          VideoBackground(
            videoController: widget.videoController,
            thumbnail: item.thumbnail,
          ),

          const _GradientOverlay(),

          // Nút và avatar bên phải
          Positioned(
            right: 10,
            bottom: 30,
            child: RightActionColumn(
              item: item,
              liked: widget.liked,
              onToggleLike: widget.onToggleLike,
              onShowComments: _showComments,
            ),
          ),

          ReelFooter(item: item),

          BigHeartAnimation(show: _showBigHeart),
        ],
      ),
    );
  }
}

class _GradientOverlay extends StatelessWidget {
  const _GradientOverlay();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      height: 260,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black87, Colors.transparent],
          ),
        ),
      ),
    );
  }
}
