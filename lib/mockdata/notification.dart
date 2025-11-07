import 'package:instargram/models/notification.dart';

final List<NotificationItem> notifications = [
  NotificationItem(
    username: 'duchuy',
    message: 'đang dùng Instagram. Có Nguyênn theo dõi họ.',
    avatar: 'images/avatar2.jpg',
    date: DateTime.now().subtract(const Duration(hours: 2)),
  ),
  NotificationItem(
    username: 'skuukzky',
    message: 'đang dùng Instagram. Có DucHuy theo dõi họ.',
    avatar: 'images/avatar3.jpg',
    date: DateTime.now().subtract(const Duration(days: 1)),
  ),
  NotificationItem(
    username: 'username36',
    message: 'đang dùng Instagram. Có Nguyênn theo dõi họ.',
    avatar: 'images/boy1.png',
    date: DateTime.now().subtract(const Duration(days: 5)),
  ),
  NotificationItem(
    username: 'geewonii',
    message: 'đang dùng Instagram. Có DucHuy theo dõi họ.',
    avatar: 'images/avatar1.jpg',
    date: DateTime.now().subtract(const Duration(days: 15)),
  ),
];
