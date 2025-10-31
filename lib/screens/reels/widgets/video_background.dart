import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoBackground extends StatelessWidget {
  final VideoPlayerController? videoController;
  final String? thumbnail;

  const VideoBackground({
    required this.videoController,
    required this.thumbnail,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (videoController != null && videoController!.value.isInitialized) {
      return FittedBox(
        fit: BoxFit.cover,
        clipBehavior: Clip.hardEdge,
        child: SizedBox(
          width: videoController!.value.size.width,
          height: videoController!.value.size.height,
          child: VideoPlayer(videoController!),
        ),
      );
    } else if (thumbnail != null) {
      return Image.network(
        thumbnail!,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, progress) => progress == null
            ? child
            : const Center(child: CircularProgressIndicator()),
      );
    } else {
      return Container(color: Colors.grey[900]);
    }
  }
}
