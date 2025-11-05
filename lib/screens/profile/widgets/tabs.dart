import 'package:flutter/material.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() => _selectedTab = 0),
                child: Column(
                  children: [
                    Icon(
                      Icons.grid_on,
                      color: _selectedTab == 0 ? Colors.black : Colors.black38,
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
                      color: _selectedTab == 1 ? Colors.black : Colors.black38,
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
                      color: _selectedTab == 2 ? Colors.black : Colors.black38,
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
      ],
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
