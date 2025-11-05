import 'package:flutter/material.dart';
import 'package:instargram/screens/home/models/post.dart';
import 'package:instargram/screens/home/widgets/comment_sheet.dart';
import 'package:instargram/screens/home/widgets/video_post_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PostWidget extends StatefulWidget {
  final Post post;
  const PostWidget({super.key, required this.post});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  late final PageController _pageController;
  int _currentPage = 0;
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

    final screenWidth = MediaQuery.of(context).size.width;
    final baseWidth = screenWidth > 700
        ? 600
        : screenWidth; // Giới hạn cho desktop
    final padding = baseWidth * 0.04;
    final avatarSize = baseWidth * 0.1;
    final iconSize = baseWidth * 0.07;
    final fontSize = baseWidth * 0.04;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar + username
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: padding,
                vertical: padding / 2,
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(avatarSize / 2),
                    child: Image.asset(
                      post.avatar,
                      height: avatarSize,
                      width: avatarSize,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: padding * 0.7),
                  Expanded(
                    child: Text(
                      post.username,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: fontSize * 1.1,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(Icons.more_vert, color: Colors.grey[700]),
                ],
              ),
            ),

            // Media
            AspectRatio(
              aspectRatio: 4 / 5,
              child: PageView(
                controller: _pageController,
                onPageChanged: (p) => setState(() => _currentPage = p),
                children: [
                  if (post.videoUrl != null)
                    VideoPostWidget(videoUrl: post.videoUrl!),
                  ...post.images.map(
                    (img) => Image.asset(
                      img,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ],
              ),
            ),

            // --- Chấm chuyển ảnh ---
            if ((post.images.length + (post.videoUrl != null ? 1 : 0)) > 1)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Center(
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: post.images.length + (post.videoUrl != null ? 1 : 0),
                    effect: ExpandingDotsEffect(
                      dotHeight: 6,
                      dotWidth: 6,
                      activeDotColor: Colors.blueAccent,
                      dotColor: Colors.grey.shade400,
                    ),
                  ),
                ),
              ),

            // --- Action bar ---
            Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      post.isLiked
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: post.isLiked ? Colors.red : Colors.black,
                      size: iconSize,
                    ),
                    onPressed: () {
                      setState(() {
                        post.isLiked = !post.isLiked;
                        post.likeCount += post.isLiked ? 1 : -1;
                      });
                    },
                  ),
                  SizedBox(width: 4),
                  Text(formatCount(post.likeCount)),

                  IconButton(
                    icon: Image.asset('images/comment.png', width: iconSize),
                    onPressed: () {
                      showCommentsSheet(
                        context,
                        post,
                        onUpdated: () => setState(() {}),
                      );
                    },
                  ),
                  SizedBox(width: 4),
                  Text(formatCount(post.cmtCount)),

                  IconButton(
                    icon: Image.asset('images/retweet.png', width: iconSize),
                    onPressed: () => setState(() => post.shareCount++),
                  ),
                  SizedBox(width: 4),
                  Text(formatCount(post.shareCount)),

                  const Spacer(),
                  IconButton(
                    icon: Icon(
                      post.isBookmarked
                          ? Icons.bookmark
                          : Icons.bookmark_border,
                      color: post.isBookmarked ? Colors.amber : Colors.black,
                      size: iconSize,
                    ),
                    onPressed: () {
                      setState(() => post.isBookmarked = !post.isBookmarked);
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
                  ),
                ],
              ),
            ),

            // --- Lượt thích ---
            if (post.likedUsers.isNotEmpty)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: baseWidth * 0.04,
                      backgroundImage: AssetImage(post.likedAvatars.first),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: fontSize * 0.9,
                          ),
                          children: [
                            TextSpan(
                              text: post.likedUsers.join(', '),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const TextSpan(
                              text: ' và những người khác đã thích',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 8),

            // --- Caption ---
            Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
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
                          style: TextStyle(fontSize: fontSize * 0.9),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        '${post.commentUser} ',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Text(
                          post.commentText,
                          style: TextStyle(fontSize: fontSize * 0.9),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    post.date,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: fontSize * 0.8,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
