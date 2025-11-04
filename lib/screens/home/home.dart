import 'package:flutter/material.dart';
import 'package:instargram/message.dart';
import 'package:instargram/screens/home/models/comment.dart';
import 'package:instargram/screens/home/models/post.dart';
import 'package:instargram/screens/home/widgets/post_widget.dart';
import 'package:instargram/screens/home/widgets/story_widget.dart';
import 'package:instargram/screens/notification.dart';

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
          content: 'Love❤️💕',
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
      commentText: 'Love 💕',
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
    Post(
      username: 'duchuy',
      avatar: 'images/avatar2.jpg',
      images: ['images/photo5.JPG', 'images/photo6.JPG'],
      videoUrl: 'videos/1.mp4',
      likeCount: 8900,
      caption: '🌿',
      commentUser: 'geewonii',
      commentText: 'Love 💕',
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
}
