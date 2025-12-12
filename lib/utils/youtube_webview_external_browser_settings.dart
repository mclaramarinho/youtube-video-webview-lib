import 'package:youtube_video_webview/utils/youtube_webview_app_bar_type.dart';

class YoutubeWebViewExternalBrowserSettings {
  final bool dragToDismiss;
  final YoutubeVideoWebviewAppBarType? appBar;

  const YoutubeWebViewExternalBrowserSettings({
    this.dragToDismiss = true,
    this.appBar,
  });
}
