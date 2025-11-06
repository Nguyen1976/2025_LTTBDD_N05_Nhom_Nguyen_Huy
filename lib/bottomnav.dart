import 'package:flutter/material.dart';
import 'package:instargram/models/post.dart';
import 'package:instargram/screens/create_post.dart';
import 'package:instargram/screens/home/home.dart';
import 'package:instargram/screens/profile/profile.dart';
import 'package:instargram/screens/reels/reels_screen.dart';
import 'package:instargram/screens/search.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int myIndex = 0;
  final List<Post> _posts = [];

  void _addPost(Post post) {
    setState(() {
      _posts.insert(0, post);
    });
  }

  @override
  Widget build(BuildContext context) {
    final widgetList = [
      Home(extraPosts: _posts),
      const Search(),
      Container(),
      const Reels(),
      const Profile(),
    ];

    return Scaffold(
      body: Center(child: widgetList[myIndex]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: myIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: const Color(0xFF8c8e98),
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) async {
          if (index == 2) {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreatePostPage(onPostCreated: _addPost),
              ),
            );
          } else {
            setState(() {
              myIndex = index;
            });
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            activeIcon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            activeIcon: Icon(Icons.add_box),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection_outlined),
            activeIcon: Icon(Icons.video_collection),
            label: 'Reels',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
