import 'package:flutter/material.dart';
import 'package:instargram/message.dart';
import 'package:instargram/mockdata/mock_post.dart';
import 'package:instargram/models/post.dart';
import 'package:instargram/screens/home/widgets/post_widget.dart';
import 'package:instargram/screens/home/widgets/story_widget.dart';
import 'package:instargram/screens/notification.dart';

class Home extends StatefulWidget {
  final List<Post> extraPosts;
  const Home({super.key, this.extraPosts = const []});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final allPosts = [...widget.extraPosts, ...mockPosts];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Builder(
          builder: (context) {
            final width = MediaQuery.of(context).size.width;
            final double titleFontSize = width < 350
                ? 26
                : (width < 500 ? 30 : 34);
            final double iconSize = width < 350 ? 24 : 30;
            final double paddingRight = width < 350 ? 6 : 12;

            return AppBar(
              elevation: 5,
              shadowColor: Colors.black.withOpacity(0.8),
              surfaceTintColor: Colors.white,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              centerTitle: false,
              title: Row(
                children: [
                  Text(
                    "Flutter",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: titleFontSize,
                      fontFamily: 'GreatVibes',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 2),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black,
                    size: iconSize + 2,
                  ),
                ],
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: paddingRight),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotificationPage(),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.black,
                      size: iconSize + 4,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: paddingRight),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Message(),
                        ),
                      );
                    },
                    child: Image.asset(
                      "images/message.png",
                      fit: BoxFit.cover,
                      width: iconSize + 2,
                      height: iconSize + 2,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
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
          ...allPosts.map((post) => PostWidget(post: post)),
        ],
      ),
    );
  }
}
