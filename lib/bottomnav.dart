import 'package:flutter/material.dart';
import 'package:instargram/screens/create_post.dart';
import 'package:instargram/screens/home/home.dart';
import 'package:instargram/screens/notification.dart';
import 'package:instargram/screens/profile.dart';
import 'package:instargram/screens/reels/reels_screen.dart';
import 'package:instargram/screens/search.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int myIndex = 0;
  List<Widget> widgetList = [
    // ignore: prefer_const_constructors
    Home(),
    // ignore: prefer_const_constructors
    Search(),
    // ignore: prefer_const_constructors
    CreatePostPage(),
    // ignore: prefer_const_constructors
    Reels(),
    // ignore: prefer_const_constructors
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: myIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Color(0xFF8c8e98),
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: 'Search',
            activeIcon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            activeIcon: Icon(Icons.add_box),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection_outlined),
            label: 'Reels',
            activeIcon: Icon(Icons.video_collection),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
            activeIcon: Icon(Icons.person),
          ),
        ],
      ),
      body: Center(child: widgetList[myIndex]),
    );
  }
}
