import 'package:flutter/material.dart';
import 'package:instargram/searchdetails.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final List<String> images = [
    'images/post1.jpg',
    'images/post2.jpg',
    'images/post3.jpg',
    'images/avatar1.jpg',
    'images/avatar2.jpg',
    'images/avatar3.jpg',
    'images/photo1.JPG',
    'images/photo2.JPG',
    'images/photo3.JPG',
    'images/photo4.JPG',
    'images/photo5.JPG',
    'images/photo6.JPG',
    'images/photo7.JPG',
    'images/t4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                readOnly: true,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchDetails(),
                    ),
                  );
                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(5.0),
                itemCount: images.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                ),
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.asset(images[index], fit: BoxFit.cover),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
