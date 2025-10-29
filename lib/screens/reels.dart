import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Reels extends StatefulWidget {
  const Reels({super.key});

  @override
  State<Reels> createState() => _ReelsState();
}

class _ReelsState extends State<Reels> with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  final Map<int, VideoPlayerController?> _videoControllers = {};
  int _currentPage = 0;

  // Example data — replace with real data source (videoUrl/thumbnailUrl)
  final List<ReelItem> _items = List.generate(
    6,
    (i) => ReelItem(
      id: 'r\$i',
      userName: 'user_name',
      userAvatar: 'images/boy1.png',
      caption: 'What goes up must come down ... #nature #travel #reel',
      likes: (i + 1) * 188000,
      comments: (i + 1) * 8514,
      shares: (i + 1) * 7646,
      sends: (i + 1) * 531000,
      videoUrl: 'videos/1.mp4',
      thumbnail: 'images/boy1.png',
    ),
  );

  final Map<String, bool> _liked = {};

  @override
  void initState() {
    super.initState();
    for (final it in _items) {
      _liked[it.id] = false;
    }

    _maybeInitVideoAt(0);
  }

  Future<void> _maybeInitVideoAt(int index) async {
    if (index < 0 || index >= _items.length) return;
    final item = _items[index];
    if (item.videoUrl == null) return;
    final existing = _videoControllers[index];

    if (existing == null) {
      try {
        final ctrl = VideoPlayerController.asset('videos/1.mp4');
        _videoControllers[index] = ctrl;
        await ctrl.initialize();
        ctrl.setLooping(true);

        //sẽ set play thằng page hiện tại thay vì luôn set play khi video init xong gây ra lỗi nhiều video cùng play 1 lúc
        // await ctrl.play();
        await _videoControllers[_currentPage]!.play();

        if (mounted) setState(() {});
      } catch (e) {
        // ignore video init errors for now
      }
    } else {
      if (!existing.value.isPlaying) await existing.play();
    }
  }

  @override
  void dispose() {
    for (final c in _videoControllers.values) {
      c?.dispose();
    }
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              itemCount: _items.length,
              onPageChanged: (newPage) async {
                final prev = _videoControllers[_currentPage];
                if (prev != null && prev.value.isPlaying) {
                  await prev.pause();
                }
                _currentPage = newPage;

                await _maybeInitVideoAt(newPage);
              },
              itemBuilder: (context, index) {
                return _ReelPage(
                  item: _items[index],
                  liked: _liked[_items[index].id] ?? false,
                  onToggleLike: () {
                    setState(() {
                      _liked[_items[index].id] =
                          !(_liked[_items[index].id] ?? false);
                    });
                  },
                  videoController: _videoControllers[index],
                );
              },
            ),

            Positioned(
              top: 8,
              left: 12,
              right: 12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Reels',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Bạn bè',
                        style: TextStyle(color: Colors.white.withOpacity(0.7)),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      for (int i = 0; i < 3; i++)
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: CircleAvatar(
                            radius: 12,
                            backgroundImage: NetworkImage(
                              'https://i.pravatar.cc/150?img=\$${i + 5}',
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReelItem {
  final String id;
  final String userName;
  final String userAvatar;
  final String caption;
  final int likes;
  final int comments;
  final int shares;
  final int sends;
  final String? videoUrl;
  final String? thumbnail;

  ReelItem({
    required this.id,
    required this.userName,
    required this.userAvatar,
    required this.caption,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.sends,
    this.videoUrl,
    this.thumbnail,
  });
}

class _ReelPage extends StatefulWidget {
  final ReelItem item;
  final bool liked;
  final VoidCallback onToggleLike;
  final VideoPlayerController? videoController;

  const _ReelPage({
    required this.item,
    required this.liked,
    required this.onToggleLike,
    this.videoController,
  });

  @override
  State<_ReelPage> createState() => _ReelPageState();
}

class _ReelPageState extends State<_ReelPage>
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
    setState(() {
      _showBigHeart = true;
    });
    _heartCtrl
        .forward(from: 0)
        .then((_) => Future.delayed(const Duration(milliseconds: 300)))
        .then((_) {
          if (mounted) {
            setState(() {
              _showBigHeart = false;
            });
          }
        });
  }

  void _togglePlayPause() {
    final controller = widget.videoController;
    if (controller == null || !controller.value.isInitialized) return;

    if (controller.value.isPlaying) {
      controller.pause();
    } else {
      controller.play();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    return GestureDetector(
      onDoubleTap: _onDoubleTap,
      onTap: _togglePlayPause,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (widget.videoController != null &&
              widget.videoController!.value.isInitialized)
            Center(
              child: FittedBox(
                fit: BoxFit.cover,
                clipBehavior: Clip.hardEdge,
                child: SizedBox(
                  width: widget.videoController!.value.size.width,
                  height: widget.videoController!.value.size.height,
                  child: VideoPlayer(widget.videoController!),
                ),
              ),
            )
          else if (item.thumbnail != null)
            Image.network(
              item.thumbnail!,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return Container(
                  color: Colors.black,
                  child: const Center(child: CircularProgressIndicator()),
                );
              },
              errorBuilder: (context, error, stack) =>
                  Container(color: Colors.grey[900]),
            )
          else
            Container(color: Colors.grey[900]),

          Positioned(
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
          ),

          Positioned(
            right: 10,
            bottom: 90,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _RightIconButton(
                  icon: widget.liked ? Icons.favorite : Icons.favorite_border,
                  label: _formatCount(item.likes, widget.liked),
                  onTap: widget.onToggleLike,
                  iconColor: widget.liked ? Colors.pinkAccent : Colors.white,
                ),
                const SizedBox(height: 18),
                _RightIconButton(
                  icon: Icons.mode_comment_outlined,
                  label: _formatCount(item.comments),
                  onTap: () {},
                ),
                const SizedBox(height: 18),
                _RightIconButton(
                  icon: Icons.repeat,
                  label: _formatCount(item.shares),
                  onTap: () {},
                ),
                const SizedBox(height: 18),
                _RightIconButton(
                  icon: Icons.send,
                  label: _formatCount(item.sends),
                  onTap: () {},
                ),
                const SizedBox(height: 22),
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(item.userAvatar),
                ),
              ],
            ),
          ),

          Positioned(
            left: 12,
            bottom: 28,
            right: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
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
          ),

          Center(
            child: AnimatedScale(
              scale: _showBigHeart ? 1.0 : 0.6,
              duration: const Duration(milliseconds: 300),
              curve: Curves.elasticOut,
              child: AnimatedOpacity(
                opacity: _showBigHeart ? 1 : 0,
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  Icons.favorite,
                  size: 120,
                  color: Colors.red.withOpacity(0.85),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String _formatCount(int count, [bool highlighted = false]) {
  if (count >= 1000000) return (count / 1000000).toStringAsFixed(1) + 'M';
  if (count >= 1000) return (count / 1000).toStringAsFixed(1) + 'K';
  return count.toString();
}

class _RightIconButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color iconColor;

  const _RightIconButton({
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
            child: Icon(
              icon,
              size: 34,
              color: iconColor,
              shadows: [
                Shadow(
                  blurRadius: 6.0,
                  color: Colors.black.withOpacity(0.6),
                  offset: Offset(2, 2),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
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
        ),
      ],
    );
  }
}
