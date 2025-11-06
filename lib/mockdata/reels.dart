import 'package:instargram/models/reel_item.dart';

List<ReelItem> reelItems = [
  ReelItem(
    id: 'r1',
    userName: 'hehe',
    userAvatar: 'images/boy2.png',
    caption: 'What goes up must come down ... #nature #travel #reel',
    isLike: false,
    likes: 188000,
    comments: 8514,
    shares: 7646,
    sends: 531000,
    videoUrl: 'videos/1.mp4',
    thumbnail: 'images/thumbnail.png',

    commentsList: [
      {
        'id': 'c1',
        'avatar': 'images/avatar1.jpg',
        'username': 'geewonii',
        'time': '2 giờ',
        'content': '❤️❤️❤️',
        'isLike': false,
        'countLike': 1,
      },
      {
        'id': 'c2',
        'avatar': 'images/avatar2.jpg',
        'username': 'duchuy',
        'time': '1 giờ',
        'content': 'Love💕',
        'isLike': true,
        'countLike': 2,
      },
    ],
  ),
  ReelItem(
    id: 'r2',
    userName: 'hehe',
    userAvatar: 'images/boy2.png',
    caption: 'What goes up must come down ... #nature #travel #reel',
    isLike: false,
    likes: 188000,
    comments: 8514,
    shares: 7646,
    sends: 531000,
    videoUrl: 'videos/1.mp4',
    thumbnail: 'images/thumbnail.png',

    commentsList: [
      {
        'id': 'c3',
        'avatar': 'images/avatar1.jpg',
        'username': 'geewonii',
        'time': '2 giờ',
        'content': '❤️❤️❤️',
        'isLike': false,
        'countLike': 1,
      },
      {
        'id': 'c4',
        'avatar': 'images/avatar2.jpg',
        'username': 'duchuy',
        'time': '1 giờ',
        'content': 'Love💕',
        'isLike': true,
        'countLike': 2,
      },
    ],
  ),
];
