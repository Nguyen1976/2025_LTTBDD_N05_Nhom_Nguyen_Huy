import 'package:flutter/material.dart';
import 'dart:math';

class NotificationItem {
  final String username;
  final String message;
  final String avatar;
  final DateTime date;

  NotificationItem({
    required this.username,
    required this.message,
    required this.avatar,
    required this.date,
  });
}

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

final List<Map<String, String>> friendSuggestions = [
  {'username': 'geewonii', 'avatar': 'images/avatar1.jpg'},
  {'username': 'duchuy', 'avatar': 'images/avatar2.jpg'},
  {'username': 'skuukzky', 'avatar': 'images/avatar3.jpg'},
];

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  late Map<String, List<NotificationItem>> groupedNotifications;
  bool showMore = false;

  @override
  void initState() {
    super.initState();
    groupedNotifications = groupNotifications(notifications);
  }

  Map<String, List<NotificationItem>> groupNotifications(
    List<NotificationItem> items,
  ) {
    final now = DateTime.now();
    final Map<String, List<NotificationItem>> grouped = {
      'Hôm nay': [],
      'Hôm qua': [],
      '7 ngày qua': [],
      '30 ngày qua': [],
    };

    for (var item in items) {
      final difference = now.difference(item.date).inDays;
      if (difference == 0) {
        grouped['Hôm nay']!.add(item);
      } else if (difference == 1) {
        grouped['Hôm qua']!.add(item);
      } else if (difference <= 7) {
        grouped['7 ngày qua']!.add(item);
      } else if (difference <= 30) {
        grouped['30 ngày qua']!.add(item);
      }
    }
    return grouped;
  }

  @override
  Widget build(BuildContext context) {
    final sections = groupedNotifications.entries
        .where((e) => e.value.isNotEmpty)
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        title: Row(
          children: const [
            Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 22),
            SizedBox(width: 8),
            Text(
              'nguyenn_535',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 4),
            Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 22),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          for (var entry in sections) ...[
            buildSectionTitle(entry.key),
            ...entry.value.map(buildNotificationItem).toList(),
            if (entry.key == '30 ngày qua') buildShowMoreButton(),
          ],
          const Divider(height: 30),
          buildSectionTitle('Gợi ý cho bạn'),
          ...buildFriendSuggestions(),
        ],
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildNotificationItem(NotificationItem item) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundImage: AssetImage(item.avatar),
        radius: 25,
      ),
      title: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black, fontSize: 14),
          children: [
            TextSpan(
              text: item.username,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: ' ${item.message}'),
          ],
        ),
      ),
      trailing: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        ),
        child: const Text('Theo dõi'),
      ),
    );
  }

  Widget buildShowMoreButton() {
    return Center(
      child: TextButton.icon(
        onPressed: () {
          setState(() {
            showMore = !showMore;
          });
        },
        icon: Icon(
          showMore ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
          color: Colors.grey[700],
        ),
        label: Text(
          showMore ? 'Ẩn bớt' : 'Xem thêm',
          style: TextStyle(color: Colors.grey[700]),
        ),
      ),
    );
  }

  List<Widget> buildFriendSuggestions() {
    return friendSuggestions.map((user) {
      return ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          backgroundImage: AssetImage(user['avatar']!),
          radius: 25,
        ),
        title: Text(
          user['username']!,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: const Text('Có người bạn chung theo dõi bạn.'),
        trailing: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          ),
          child: const Text('Theo dõi'),
        ),
      );
    }).toList();
  }
}
