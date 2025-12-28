import 'package:flutter/material.dart';
import 'package:youtube_video_webview/youtube_video_webview.dart';

class Simple extends StatelessWidget {
  const Simple({super.key});

  @override
  Widget build(BuildContext context) {
    return YoutubeVideoWebview(
      videoId: '<ENTER_VIDEO_ID>',
      referrerHeader: '<ENTER_REFERRER_URL>',
    );
  }
}
