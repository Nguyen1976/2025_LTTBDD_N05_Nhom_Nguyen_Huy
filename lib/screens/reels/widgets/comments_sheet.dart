import 'package:flutter/material.dart';

class CommentsSheet extends StatelessWidget {
  const CommentsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.6,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
        ),
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              const SizedBox(height: 8),
              const _DragHandle(),
              const SizedBox(height: 12),
              const Text(
                'Bình luận',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  itemCount: 6,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, idx) {
                    final username = idx == 0 ? 'ykuoai62miyama' : 'user$idx';
                    final avatar = idx == 0
                        ? 'images/boy1.png'
                        : 'images/boy1.png';
                    final text = idx == 0
                        ? '😍😍😍😍'
                        : (idx == 1
                              ? 'Quién pudiera estar en lugar de la masajista'
                              : 'Aí aí oxx33');
                    final likes = idx == 1 ? 2 : 1;
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundImage: AssetImage(avatar),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    username,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    '2 ngày',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                text,
                                style: const TextStyle(color: Colors.black),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  Text(
                                    'Trả lời',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    'Xem bản dịch',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          children: [
                            Icon(
                              Icons.favorite_border,
                              color: Colors.black54,
                              size: 20,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              likes.toString(),
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
              Container(
                color: Colors.transparent,
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 44,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          SizedBox(width: 8),
                          Text('❤️', style: TextStyle(fontSize: 22)),
                          SizedBox(width: 12),
                          Text('🙌', style: TextStyle(fontSize: 22)),
                          SizedBox(width: 12),
                          Text('🔥', style: TextStyle(fontSize: 22)),
                          SizedBox(width: 12),
                          Text('👏', style: TextStyle(fontSize: 22)),
                          SizedBox(width: 12),
                          Text('😢', style: TextStyle(fontSize: 22)),
                          SizedBox(width: 12),
                          Text('😍', style: TextStyle(fontSize: 22)),
                          SizedBox(width: 12),
                          Text('😮', style: TextStyle(fontSize: 22)),
                          SizedBox(width: 12),
                          Text('😂', style: TextStyle(fontSize: 22)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 18,
                          backgroundImage: AssetImage('images/boy1.png'),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    style: const TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                      hintText: 'Tham gia cuộc trò chuyện...',
                                      hintStyle: const TextStyle(
                                        color: Colors.black54,
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 10,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          30,
                                        ), // bo tròn viền
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                        ), // màu viền khi chưa focus
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          30,
                                        ), // bo tròn khi focus
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                        ), // màu viền khi focus
                                      ),
                                      filled: true, // có nền bên trong
                                      fillColor: Colors.white, // màu nền
                                    ),
                                  ),
                                ),

                                const Icon(
                                  Icons.emoji_emotions_outlined,
                                  color: Colors.black54,
                                ),
                                const SizedBox(width: 8),
                                const Icon(
                                  Icons.card_giftcard,
                                  color: Colors.black54,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DragHandle extends StatelessWidget {
  const _DragHandle();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 2,
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
