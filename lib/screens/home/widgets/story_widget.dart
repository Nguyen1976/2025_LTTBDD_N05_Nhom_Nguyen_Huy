import 'package:flutter/material.dart';

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
