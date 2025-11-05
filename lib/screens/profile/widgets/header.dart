import 'package:flutter/material.dart';
import 'package:instargram/service/auth.dart';
import 'package:instargram/screens/login.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Text(
                'nguyenn_535',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 6),
              const Icon(Icons.arrow_drop_down, color: Colors.black),
            ],
          ),
        ),
        Row(
          children: [
            const Icon(Icons.currency_exchange_outlined, color: Colors.black),
            const SizedBox(width: 12),
            const Icon(Icons.add_box_outlined, color: Colors.black),
            const SizedBox(width: 12),
            // Popup menu for more actions (includes logout)
            PopupMenuButton<String>(
              icon: const Icon(Icons.menu, color: Colors.black),
              onSelected: (value) async {
                if (value == 'logout') {
                  AuthMethods().signOut();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const LogIn()),
                    (route) => false,
                  );
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem<String>(
                  value: 'logout',
                  child: Text('Đăng xuất'),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
