import 'comment.dart';

class Post {
  final String username;
  final String avatar;
  final List<String> images;
  int likeCount;
  bool isLiked;
  bool isBookmarked;
  final String caption;
  final String commentUser;
  final String commentText;
  final String date;
  final List<String> likedUsers;
  final List<String> likedAvatars;
  int cmtCount;
  int shareCount;
  int sendCount;
  List<Comment> comments;
  final String? videoUrl;

  Post({
    required this.username,
    required this.avatar,
    required this.images,
    required this.likeCount,
    required this.caption,
    required this.commentUser,
    required this.commentText,
    required this.date,
    this.isLiked = false,
    this.isBookmarked = false,
    this.likedUsers = const [],
    this.likedAvatars = const [],
    this.cmtCount = 0,
    this.shareCount = 0,
    this.sendCount = 0,
    this.comments = const [],
    this.videoUrl,
  });
}
