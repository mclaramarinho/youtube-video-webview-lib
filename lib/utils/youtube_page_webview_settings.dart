part of 'package:youtube_video_webview/youtube_video_webview.dart';

class YoutubePageWebViewSettings {
  final bool dragToDismiss;
  final YoutubeVideoWebviewAppBarType? appBar;

  const YoutubePageWebViewSettings({
    this.dragToDismiss = true,
    this.appBar,
  });
}
