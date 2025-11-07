import 'package:flutter/material.dart';
import 'package:instargram/models/comment.dart';
import 'package:instargram/models/post.dart';
import 'package:easy_localization/easy_localization.dart';

class CreatePostPage extends StatefulWidget {
  final Function(Post)? onPostCreated;

  const CreatePostPage({super.key, this.onPostCreated});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final _captionController = TextEditingController();
  final List<String> _selectedImages = [];

  final List<String> _imagePaths = [
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

  void _submit() {
    if (_selectedImages.isEmpty) return;

    final newPost = Post(
      username: 'Nguyênn',
      avatar: 'images/boy1.png',
      images: _selectedImages,
      likeCount: 0,
      caption: _captionController.text,
      commentUser: '',
      commentText: '',
      date: 'Vừa xong',
      likedUsers: [],
      likedAvatars: [],
      comments: <Comment>[],
    );

    widget.onPostCreated?.call(newPost);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('create_post')),
        actions: [
          TextButton(
            onPressed: _submit,
            child: Text(
              tr('share'),
              style: TextStyle(color: Colors.blue, fontSize: 18),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          // Hiển thị các ảnh được chọn
          _selectedImages.isNotEmpty
              ? SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _selectedImages.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Image.asset(
                          _selectedImages[index],
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                )
              : Container(
                  height: 200,
                  color: Colors.grey[300],
                  child: Center(child: Text(tr('select_img'))),
                ),
          const SizedBox(height: 10),

          // Grid chọn ảnh
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: _imagePaths.length,
              itemBuilder: (context, index) {
                final path = _imagePaths[index];
                final isSelected = _selectedImages.contains(path);

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        _selectedImages.remove(path);
                      } else {
                        _selectedImages.add(path);
                      }
                    });
                  },
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(path, fit: BoxFit.cover),
                      if (isSelected)
                        Container(
                          color: Colors.black.withOpacity(0.4),
                          child: const Icon(
                            Icons.check_circle,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Chú thích
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              controller: _captionController,
              decoration: InputDecoration(
                hintText: tr('caption'),
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }
}
