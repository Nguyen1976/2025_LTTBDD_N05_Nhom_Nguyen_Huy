import 'package:flutter/material.dart';
import 'package:instargram/screens/reels/models/reel_item.dart';
import 'package:instargram/screens/reels/widgets/reel_page.dart';
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
      thumbnail: 'images/thumbnail.png',
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
                return ReelPage(
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
              left: MediaQuery.of(context).size.width / 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Reels',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Row(
                        children: [
                          Text(
                            'Bạn bè',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            width: 100,
                            child: Stack(
                              children: [
                                for (int i = 0; i < 3; i++)
                                  Positioned(
                                    left: (i) * 16.0 + 2,
                                    top: 10,
                                    child: CircleAvatar(
                                      radius: 10,
                                      backgroundImage: AssetImage(
                                        'images/boy1.png',
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
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
