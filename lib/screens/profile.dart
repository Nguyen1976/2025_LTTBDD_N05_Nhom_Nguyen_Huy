import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final List<SuggestUser> _suggestions = List.generate(
    6,
    (i) => SuggestUser(
      name: i == 0 ? 'Nguyênn' : 'Người dùng ${i + 1}',
      subtitle: i == 0
          ? 'Có _duchuyy74 và 2 người khác theo dõi'
          : 'Có _duchuyy74 và 2 người khác theo dõi',
      avatar: 'https://picsum.photos/${i + 200}',
    ),
  );

  int _selectedTab = 0;

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
              // top row: username + actions
              Row(
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
                    children: const [
                      Icon(
                        Icons.currency_exchange_outlined,
                        color: Colors.black,
                      ),
                      SizedBox(width: 12),
                      Icon(Icons.add_box_outlined, color: Colors.black),
                      SizedBox(width: 12),
                      Icon(Icons.menu, color: Colors.black),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 18),

              // avatar + stats
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
                        _statColumn('0', 'bài viết'),
                        _statColumn('20', 'người theo dõi'),
                        _statColumn('37', 'đang theo dõi'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // name and buttons
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
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 3),
                        child: Text(
                          'Chỉnh sửa',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
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
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 1),
                        child: Text(
                          'Chia sẻ trang cá nhân',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Khám phá mọi người',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Xem tất cả',
                      style: TextStyle(
                        color: Colors.blue[400],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // horizontal suggestion cards
              SizedBox(
                height: 220,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _suggestions.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final s = _suggestions[index];
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.48,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey[100]!),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {},
                              child: const Icon(
                                Icons.close,
                                size: 16,
                                color: Colors.black45,
                              ),
                            ),
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(s.avatar),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6.0,
                            ),
                            child: Text(
                              s.name,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6.0,
                            ),
                            child: Text(
                              s.subtitle,
                              style: const TextStyle(
                                color: Colors.black45,
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.0,
                                vertical: 0,
                              ),
                              child: Text(
                                'Theo dõi',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 18),

              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedTab = 0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.grid_on,
                            color: _selectedTab == 0
                                ? Colors.black
                                : Colors.black38,
                          ),
                          const SizedBox(height: 6),
                          Container(
                            height: 2,
                            color: _selectedTab == 0
                                ? Colors.black
                                : Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedTab = 1),
                      child: Column(
                        children: [
                          Icon(
                            Icons.video_collection_outlined,
                            color: _selectedTab == 1
                                ? Colors.black
                                : Colors.black38,
                          ),
                          const SizedBox(height: 6),
                          Container(
                            height: 2,
                            color: _selectedTab == 1
                                ? Colors.black
                                : Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedTab = 2),
                      child: Column(
                        children: [
                          Icon(
                            Icons.person_outline,
                            color: _selectedTab == 2
                                ? Colors.black
                                : Colors.black38,
                          ),
                          const SizedBox(height: 6),
                          Container(
                            height: 2,
                            color: _selectedTab == 2
                                ? Colors.black
                                : Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              // tab-specific content
              if (_selectedTab == 0) _buildGridTab(),
              if (_selectedTab == 1) _buildReelsTab(),
              if (_selectedTab == 2) _buildTaggedTab(),

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

  Widget _buildGridTab() {
    const int itemCount = 12;
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 2,
      mainAxisSpacing: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1,
      children: List.generate(itemCount, (i) {
        final src = 'https://picsum.photos/${i + 200}';
        return Container(
          color: const Color(0xFF1B1B1D),
          child: Image.network(
            src,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => const SizedBox(),
          ),
        );
      }),
    );
  }

  Widget _buildReelsTab() {
    const int itemCount = 9;
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1,
      children: List.generate(itemCount, (i) {
        final src = 'https://picsum.photos/${i + 200}';
        return Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: const Color(0xFF1B1B1D),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(
                  src,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const SizedBox(),
                ),
              ),
            ),
            const Center(
              child: Icon(
                Icons.play_circle_outline,
                color: Colors.white70,
                size: 36,
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildTaggedTab() {
    const int itemCount = 6;
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1,
      children: List.generate(itemCount, (i) {
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1B1B1D),
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Center(
            child: Icon(Icons.person_pin_outlined, color: Colors.white24),
          ),
        );
      }),
    );
  }
}

class SuggestUser {
  final String name;
  final String subtitle;
  final String avatar;

  SuggestUser({
    required this.name,
    required this.subtitle,
    required this.avatar,
  });
}
