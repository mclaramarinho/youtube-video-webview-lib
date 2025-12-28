import 'package:flutter/material.dart';
import 'package:youtube_video_webview/youtube_video_webview.dart';

class DragToDismiss extends StatelessWidget {
  const DragToDismiss({super.key});

  @override
  Widget build(BuildContext context) {
    return YoutubeVideoWebview(
      videoId: '<ENTER_VIDEO_ID>',
      referrerHeader: '<ENTER_REFERRER_URL>',
      externalBrowserSettings: YoutubePageWebViewSettings(
        appBar: YoutubeVideoWebviewAppBarCustom(
          appBar: AppBar(
            title: const Text('Custom App Bar'),
            backgroundColor: Colors.green,
          ),
        ),
      ),
    );
  }
}
