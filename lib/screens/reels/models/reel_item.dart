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
  });
}