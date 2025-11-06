import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class CommentsSheet extends StatelessWidget {
  final List<dynamic> commentsList;
  const CommentsSheet({super.key, required this.commentsList});

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
              Text(
                'comments_title'.tr(),
                style: const TextStyle(
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
                  itemCount: commentsList.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, idx) {
                    final comment = commentsList[idx];
                    final like = comment['isLike'];
                    final countLike = comment['countLike'];

                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundImage: AssetImage(comment['avatar']),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    comment['username'],
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'time_2_days'.tr(),
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                comment['content'],
                                style: const TextStyle(color: Colors.black),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  Text(
                                    'comments_reply'.tr(),
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    'comments_see_translation'.tr(),
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
                            (like
                                ? Icon(
                                    Icons.favorite_border,
                                    color: Colors.black54,
                                    size: 20,
                                  )
                                : Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 20,
                                  )),

                            const SizedBox(height: 6),
                            Text(
                              countLike.toString(),
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
                                      hintText: 'comments_input_hint'.tr(),
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
                                        ), 
                                        borderSide: const BorderSide(
                                          color: Colors.grey,
                                        ), 
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          30,
                                        ), 
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                        ), 
                                      ),
                                      filled: true,
                                      fillColor: Colors.white, 
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
