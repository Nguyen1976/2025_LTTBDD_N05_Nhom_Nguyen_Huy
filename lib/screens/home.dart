import 'package:flutter/material.dart';
import 'package:instargram/message.dart';
import 'package:instargram/screens/notification.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Post> posts = [
    Post(
      username: 'geewonii',
      avatar: 'images/avatar1.jpg',
      images: ['images/post1.jpg', 'images/post2.jpg', 'images/post3.jpg'],
      likeCount: 15200,
      caption: '📸 ',
      commentUser: 'duchuy',
      commentText: 'Love❤️💕',
      date: 'Ngày 7 tháng 4, 2025',
      likedUsers: ['duchuy', 'skuukzky'],
      likedAvatars: ['images/avatar2.jpg'],
      cmtCount: 15200,
      shareCount: 7400,
      sendCount: 120000,
      comments: [
        Comment(
          avatar: 'images/avatar1.jpg',
          username: 'geewonii',
          time: '2 giờ',
          content: '❤️❤️❤️',
        ),
        Comment(
          avatar: 'images/avatar2.jpg',
          username: 'duchuy',
          time: '1 giờ',
          content: '🔥🔥',
        ),
      ],
    ),
    Post(
      username: 'duchuy',
      avatar: 'images/avatar2.jpg',
      images: ['images/photo5.JPG', 'images/photo6.JPG', 'images/t4.jpg'],
      likeCount: 8900,
      caption: '🌿',
      commentUser: 'geewonii',
      commentText: 'Love these pictures 💕',
      date: 'Ngày 31 tháng 10, 2025',
      likedUsers: ['geewonii', 'skuukzky'],
      likedAvatars: ['images/avatar1.jpg'],
      cmtCount: 200,
      shareCount: 70,
      sendCount: 10,
      comments: [
        Comment(
          avatar: 'images/avatar1.jpg',
          username: 'geewonii',
          time: '2 giờ',
          content: '❤️❤️❤️',
        ),
        Comment(
          avatar: 'images/avatar3.jpg',
          username: 'skuukzky',
          time: '1 giờ',
          content: '🔥🔥',
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 5,
        shadowColor: Colors.black.withOpacity(0.8),
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,

        title: Row(
          children: [
            const Text(
              "Instagram",
              style: TextStyle(
                color: Colors.black,
                fontSize: 34.0,
                fontFamily: 'GreatVibes',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.black,
              size: 28.0,
            ),
          ],
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationPage(),
                  ),
                );
              },
              child: const Icon(
                Icons.favorite_border,
                color: Colors.black,
                size: 32.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Message()),
                );
              },
              child: Image.asset(
                "images/message.png",
                fit: BoxFit.cover,
                width: 32.0,
                height: 32.0,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 10.0),
        children: [
          SizedBox(
            height: 110,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(width: 10),
                buildStory('images/boy1.png', 'Tin của bạn', isYourStory: true),
                buildStory('images/avatar1.jpg', 'geewonii'),
                buildStory('images/avatar2.jpg', 'duchuy'),
                buildStory('images/avatar3.jpg', 'skuukzky'),
                buildStory('images/avatar2.jpg', 'duchuy'),
                buildStory('images/avatar3.jpg', 'skuukzky'),
                buildStory('images/avatar2.jpg', 'duchuy'),
                buildStory('images/avatar3.jpg', 'skuukzky'),
                const SizedBox(width: 10),
              ],
            ),
          ),
          //Duyet ds post, tao PostWidget, sau do trai widget de hien thi ListView
          ...posts.map((post) => PostWidget(post: post)),
        ],
      ),
    );
  }

  Widget buildStory(String image, String username, {bool isYourStory = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: isYourStory
                      ? null
                      : const LinearGradient(
                          colors: [Colors.purple, Colors.orange],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                ),
                padding: const EdgeInsets.all(2.5),
                child: CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(image),
                ),
              ),
              if (isYourStory)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    padding: const EdgeInsets.all(3),
                    child: const Icon(Icons.add, size: 16, color: Colors.white),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 5),
          Text(username, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

class Comment {
  final String avatar;
  final String username;
  final String time;
  final String content;

  Comment({
    required this.avatar,
    required this.username,
    required this.time,
    required this.content,
  });
}

class Post {
  final String username;
  final String avatar;
  final List<String> images;
  int likeCount;
  bool isLiked;
  bool isBookmarked;
  final String caption;
  final String commentUser;
  final String commentText;
  final String date;
  final List<String> likedUsers;
  final List<String> likedAvatars;
  int cmtCount;
  int shareCount;
  int sendCount;

  List<Comment> comments;

  Post({
    required this.username,
    required this.avatar,
    required this.images,
    required this.likeCount,
    required this.caption,
    required this.commentUser,
    required this.commentText,
    required this.date,
    this.isLiked = false,
    this.isBookmarked = false,
    this.likedUsers = const [],
    this.likedAvatars = const [],
    this.cmtCount = 0,
    this.shareCount = 0,
    this.sendCount = 0,
    this.comments = const [],
  });
}

class PostWidget extends StatefulWidget {
  final Post post;
  const PostWidget({super.key, required this.post});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  late final PageController _pageController;
  int _currentPage = 0; // ignore: unused_field

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
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

  void showCommentsSheet(BuildContext context, Post post) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.75,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          builder: (context, ScrollController) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Bình luận',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                Expanded(
                  child: ListView.builder(
                    controller: ScrollController,
                    itemCount: post.comments.length,
                    itemBuilder: (context, index) {
                      final cmt = post.comments[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(cmt.avatar),
                          radius: 20,
                        ),
                        title: Row(
                          children: [
                            Text(
                              cmt.username,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              cmt.time,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text(cmt.content),
                        trailing: const Icon(Icons.favorite_border, size: 20),
                      );
                    },
                  ),
                ),

                //cmt
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.grey[300]!)),
                  ),
                  child: SafeArea(
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage('images/boy1.png'),
                          radius: 18,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Thêm bình luận...',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.emoji_emotions_outlined),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
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
          color: const Color(0xFF111111),
          child: PageView(
            controller: _pageController,
            onPageChanged: (p) => setState(() => _currentPage = p),
            children: post.images.map((img) {
              return Image.asset(img, fit: BoxFit.cover);
            }).toList(),
          ),
        ),

        if (post.images.length > 1) ...[
          const SizedBox(height: 8),
          Center(
            child: SmoothPageIndicator(
              controller: _pageController,
              count: post.images.length,
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
                  showCommentsSheet(context, post);
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
