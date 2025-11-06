class Comment {
  final String avatar;
  final String username;
  final String time;
  final String content;
  bool isLiked;

  Comment({
    required this.avatar,
    required this.username,
    required this.time,
    required this.content,
    this.isLiked = false,
  });
}
