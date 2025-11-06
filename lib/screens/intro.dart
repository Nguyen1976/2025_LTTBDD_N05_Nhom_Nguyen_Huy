import 'package:flutter/material.dart';
import 'package:instargram/main.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    final members = <Map<String, String>>[
      {'name': 'Huy', 'role': 'Home, Notification, Search screen, bottom nav'},
      {'name': 'Huy', 'role': 'Làm báo cáo, slide'},
      {
        'name': 'Nguyen',
        'role': 'Authentication with firebase, Reels screen, Profile screen',
      },
      {'name': 'Nguyen', 'role': 'Thuyết trình, quay video demo'},

      {'name': 'Nguyen', 'role': 'Đóng góp cho toàn bộ dự án: 50%'},
      {'name': 'Huy', 'role': 'Đóng góp cho toàn bộ dự án: 50%'},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Intro', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8),
              const Text(
                'Nhóm: 2025_LTTBDD_N05_Nhom_Nguyen_Huy',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              const Text(
                'Phân công công việc',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),

              // Simple text list: each line shows "Tên — Công việc"
              Expanded(
                child: Card(
                  color: Colors.white,
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (final m in members) ...[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              '${m['name']} — ${m['role']}',
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),
                          const Divider(height: 1),
                        ],
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AuthGate()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Tiếp tục',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
