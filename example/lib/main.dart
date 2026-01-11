import 'package:flutter/material.dart';
import 'package:youtube_video_webview/youtube_video_webview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouTube Video Webview Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Center(child: const Simple()),
    );
  }
}

class Simple extends StatelessWidget {
  const Simple({super.key});

  @override
  Widget build(BuildContext context) {
    return YoutubeVideoWebview(
      videoId: 'ssRIT1OwdWE',
      referrerHeader: 'https://www.example.com',
    );
  }
}


class DragToDismiss extends StatelessWidget {
  const DragToDismiss({super.key});

  @override
  Widget build(BuildContext context) {
    return YoutubeVideoWebview(
      videoId: '<ENTER_VIDEO_ID>',
      referrerHeader: '<ENTER_REFERRER_URL>',
      externalBrowserSettings: YoutubePageWebViewSettings(
        dragToDismiss: true
      ),
    );
  }
}


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


class ShareAppBar extends StatelessWidget {
  const ShareAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return YoutubeVideoWebview(
      videoId: '<ENTER_VIDEO_ID>',
      referrerHeader: '<ENTER_REFERRER_URL>',
      externalBrowserSettings: YoutubePageWebViewSettings(
        appBar: YoutubeVideoWebviewAppBarShare(
          videoId: '<ENTER_VIDEO_ID>',
          shareText: "Check out this video!",
        ),
      ),
    );
  }
}


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

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

