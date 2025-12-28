import 'package:flutter/material.dart';
import 'package:youtube_video_webview/youtube_video_webview.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return YoutubeVideoWebview(
      videoId: '<ENTER_VIDEO_ID>',
      referrerHeader: '<ENTER_REFERRER_URL>',
      externalBrowserSettings: YoutubePageWebViewSettings(
        appBar: YoutubeVideoWebviewAppBarDefault(),
      ),
    );
  }
}
