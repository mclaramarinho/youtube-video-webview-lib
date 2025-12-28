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
      home: Scaffold(
        appBar: AppBar(title: const Text('Youtube Video Webview Example')),
        body: SafeArea(
          maintainBottomViewPadding: true,
          child: Center(
            child: YoutubeVideoWebview(
              videoId: 'LoheCz4t2xc',
              referrerHeader: 'https://www.google.com',
              externalBrowserSettings: YoutubePageWebViewSettings(
                // dragToDismiss: true
                // appBar: YoutubeVideoWebviewAppBarDefault(),
                appBar: YoutubeVideoWebviewAppBarShare(videoId: 'jqKtxmf8x7A', shareText: "Check out this video!"),
                // appBar: YoutubeVideoWebviewAppBarCustom(appBar: AppBar(
                //   title: const Text('Custom App Bar'),
                //   backgroundColor: Colors.green,
                // ),),
              ),
            ), // your widget here
          ),
        ),
      ),
    );
  }
}
