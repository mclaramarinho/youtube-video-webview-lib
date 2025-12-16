import 'package:flutter/material.dart';
import 'package:youtube_video_webview/utils/design/responsive_size.dart';

class YoutubeWebviewDragHandle extends StatelessWidget {
  const YoutubeWebviewDragHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: ResponsiveSize.x10),
      child: Center(
        child: Container(
          width: ResponsiveSize.x40,
          height: ResponsiveSize.x5,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(ResponsiveSize.x10),
          ),
        ),
      ),
    );
  }
}