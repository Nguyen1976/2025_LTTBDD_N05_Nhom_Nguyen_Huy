import 'package:flutter/material.dart';
import 'package:instargram/main.dart';
import 'package:easy_localization/easy_localization.dart';

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
        title: Text(
          'group_label'.tr(),
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: ListView(
            children: [
              const SizedBox(height: 12),

              // Language selector
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => context.setLocale(const Locale('vi')),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      elevation: 0,
                      side: const BorderSide(color: Colors.black12),
                    ),
                    child: const Text('Tiếng Việt'),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () => context.setLocale(const Locale('en')),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      elevation: 0,
                      side: const BorderSide(color: Colors.black12),
                    ),
                    child: const Text('English'),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Card(
                color: Colors.white,
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 12.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'group_info_title'.tr(),
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      const Text('Nguyễn Hà Nguyên — MSV 23010310'),
                      const SizedBox(height: 6),
                      const Text('Hoàng Lê Đức Huy — MSV 000000'),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 8),

              const SizedBox(height: 8),

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
                child: Text(
                  'continue'.tr(),
                  style: const TextStyle(
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
