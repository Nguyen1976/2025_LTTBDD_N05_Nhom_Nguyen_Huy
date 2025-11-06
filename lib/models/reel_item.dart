class ReelItem {
  final String id;
  final String userName;
  final String userAvatar;
  final String caption;
  final int likes;
  final int comments;
  final int shares;
  final int sends;
  final String? videoUrl;
  final String? thumbnail;
  bool isLike;
  final List<dynamic> commentsList;

  ReelItem({
    required this.id,
    required this.userName,
    required this.userAvatar,
    required this.caption,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.sends,
    this.videoUrl,
    this.thumbnail,
    this.isLike = false,
    this.commentsList = const [],
  });

  void operator [](String other) {}
}
