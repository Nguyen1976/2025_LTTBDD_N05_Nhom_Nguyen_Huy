import 'package:flutter/material.dart';
import 'package:instargram/screens/home/models/post.dart';
import 'package:instargram/screens/home/widgets/comment_sheet.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:instargram/screens/home/widgets/video_post_widget.dart';

class PostWidget extends StatefulWidget {
  final Post post;
  const PostWidget({super.key, required this.post});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  late final PageController _pageController;
  int _currentPage = 0; // ignore: unused_field
  final TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  String formatCount(int count) {
    if (count >= 1000000) {
      return '${(count / 1000000).toStringAsFixed(1)}M';
    } else if (count >= 1000) {
      String value = (count / 1000).toStringAsFixed(1);
      if (value.endsWith('.0')) value = value.substring(0, value.length - 2);
      return '${value}K';
    } else {
      return count.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    final post = widget.post;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.asset(
                  post.avatar,
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10.0),
              Text(
                post.username,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        Container(
          height: 400,
          color: Colors.black,
          child: PageView(
            controller: _pageController,
            onPageChanged: (p) => setState(() => _currentPage = p),
            children: [
              if (post.videoUrl != null)
                VideoPostWidget(videoUrl: post.videoUrl!),

              ...post.images.map((img) => Image.asset(img, fit: BoxFit.cover)),
            ],
          ),
        ),

        if ((post.images.length + (post.videoUrl != null ? 1 : 0)) > 1) ...[
          const SizedBox(height: 8),
          Center(
            child: SmoothPageIndicator(
              controller: _pageController,
              count: post.images.length + (post.videoUrl != null ? 1 : 0),
              effect: ExpandingDotsEffect(
                dotHeight: 8,
                dotWidth: 8,
                activeDotColor: Colors.blueAccent,
                dotColor: Colors.grey.shade400,
              ),
            ),
          ),
        ],

        const SizedBox(height: 10.0),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    post.isLiked = !post.isLiked;
                    post.likeCount += post.isLiked ? 1 : -1;
                  });
                },
                child: Icon(
                  post.isLiked
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                  color: post.isLiked ? Colors.red : Colors.black,
                  size: 30.0,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                formatCount(post.likeCount),
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: () {
                  showCommentsSheet(
                    context,
                    post,
                    onUpdated: () {
                      setState(() {});
                    },
                  );
                },
                child: Row(
                  children: [
                    Image.asset(
                      'images/comment.png',
                      width: 30.0,
                      height: 30.0,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      formatCount(post.cmtCount),
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: () {
                  setState(() {
                    post.shareCount++;
                  });
                },
                child: Row(
                  children: [
                    Image.asset(
                      'images/retweet.png',
                      width: 30.0,
                      height: 30.0,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      formatCount(post.shareCount),
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: () {
                  setState(() {
                    post.sendCount++;
                  });
                },
                child: Row(
                  children: [
                    Image.asset('images/send.png', width: 30.0, height: 30.0),
                    const SizedBox(width: 4),
                    Text(
                      formatCount(post.sendCount),
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    post.isBookmarked = !post.isBookmarked;
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        post.isBookmarked
                            ? 'Đã lưu vào bộ sưu tập'
                            : 'Đã xoá khỏi bộ sưu tập',
                      ),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                child: Icon(
                  post.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  size: 30.0,
                  color: post.isBookmarked
                      ? Colors.amber
                      : Colors.black, // đổi sang vàng
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),
        if (post.likedUsers.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundImage: AssetImage(post.likedAvatars.first),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.black, fontSize: 14),
                      children: [
                        TextSpan(
                          text: post.likedUsers.join(', '),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(text: ' và những người khác đã thích'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '${post.username} ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Text(
                      post.caption,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5.0),

              Row(
                children: [
                  Text(
                    '${post.commentUser} ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(post.commentText),
                ],
              ),

              const SizedBox(height: 5.0),
              Text(
                post.date,
                style: const TextStyle(color: Colors.grey, fontSize: 12.0),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
