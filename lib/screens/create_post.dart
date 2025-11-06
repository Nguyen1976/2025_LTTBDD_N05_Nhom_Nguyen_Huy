import 'package:flutter/material.dart';
import 'package:instargram/screens/home/models/comment.dart';
import 'package:instargram/screens/home/models/post.dart';

class CreatePostPage extends StatefulWidget {
  final Function(Post)? onPostCreated;

  const CreatePostPage({super.key, this.onPostCreated});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final _captionController = TextEditingController();
  String? _selectedImage;

  final List<String> _imagePaths = [
    'images/post1.jpg',
    'images/post2.jpg',
    'images/post3.jpg',
    'images/post4.jpg',
    'images/post5.jpg',
  ];

  void _submit() {
    if (_selectedImage == null) return;

    final newPost = Post(
      username: 'geewonii',
      avatar: 'images/avatar1.jpg',
      images: [_selectedImage!],
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
    Navigator.pop(context); // quay về home
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tạo bài viết"),
        actions: [
          TextButton(
            onPressed: _submit,
            child: const Text(
              "Đăng",
              style: TextStyle(color: Colors.blue, fontSize: 18),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          // Hiển thị ảnh được chọn
          _selectedImage != null
              ? Image.asset(_selectedImage!, height: 200, fit: BoxFit.cover)
              : Container(
                  height: 200,
                  color: Colors.grey[300],
                  child: const Center(child: Text("Chọn ảnh bên dưới")),
                ),
          const SizedBox(height: 10),
          // Grid ảnh để chọn
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
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedImage = path;
                    });
                  },
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(path, fit: BoxFit.cover),
                      if (_selectedImage == path)
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
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _captionController,
              decoration: const InputDecoration(
                hintText: "Viết chú thích...",
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
