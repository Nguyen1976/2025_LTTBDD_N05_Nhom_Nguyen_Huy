import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../models/post.dart';
import '../../../models/comment.dart';

void showCommentsSheet(
  BuildContext context,
  Post post, {
  required VoidCallback onUpdated,
}) {
  final TextEditingController commentController = TextEditingController();

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
        builder: (context, scrollController) {
          return StatefulBuilder(
            builder: (context, setModalState) {
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

                  Text(
                    tr('comment'),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),

                  // --- Danh sách comment ---
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: post.comments.length,
                      itemBuilder: (context, index) {
                        final cmt = post.comments[index];

                        return StatefulBuilder(
                          builder: (context, localSetState) {
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
                              trailing: GestureDetector(
                                onTap: () {
                                  localSetState(() {
                                    cmt.isLiked = !cmt.isLiked;
                                  });
                                },
                                child: Icon(
                                  cmt.isLiked
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: cmt.isLiked ? Colors.red : Colors.grey,
                                  size: 20,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),

                  // --- Ô nhập comment ---
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
                              controller: commentController,
                              decoration: InputDecoration(
                                hintText: tr('cmt_input'),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              final text = commentController.text.trim();
                              if (text.isNotEmpty) {
                                final newComment = Comment(
                                  avatar: 'images/boy1.png',
                                  username: 'you',
                                  time: tr('time_created'),
                                  content: text,
                                );

                                setModalState(() {
                                  post.comments.add(newComment);
                                  post.cmtCount = post.comments.length;
                                });

                                onUpdated(); // cập nhật lại ở PostWidget

                                commentController.clear();
                                FocusScope.of(context).unfocus();
                              }
                            },
                            icon: const Icon(Icons.send, color: Colors.blue),
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
    },
  );
}
