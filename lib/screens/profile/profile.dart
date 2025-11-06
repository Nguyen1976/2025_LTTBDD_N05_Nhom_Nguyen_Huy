import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:instargram/screens/profile/widgets/discover_people.dart';
import 'package:instargram/screens/profile/widgets/header.dart';
import 'package:instargram/screens/profile/widgets/tabs.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final bg = Colors.white;
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              const SizedBox(height: 18),

              Row(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        radius: 46,
                        backgroundColor: Colors.grey[800],
                        backgroundImage: const AssetImage('images/boy1.png'),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 18),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _statColumn('0', 'profile_posts'.tr()),
                        _statColumn('20', 'profile_followers'.tr()),
                        _statColumn('37', 'profile_following'.tr()),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              const Text(
                'Nguyênn',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},

                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.grey[200],
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: BorderSide.none,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Text(
                          'btn_edit'.tr(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.grey[200],
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: BorderSide.none,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 1),
                        child: Text(
                          'btn_share_profile'.tr(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(7),
                    child: const Icon(Icons.person_add, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 18),

              // Discover people title
              DiscoverPeople(),

              const SizedBox(height: 18),

              Tabs(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statColumn(String count, String label) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            count,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black87),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
