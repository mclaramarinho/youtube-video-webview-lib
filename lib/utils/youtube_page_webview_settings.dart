part of 'package:youtube_video_webview/youtube_video_webview.dart';

class YoutubePageWebViewSettings {
  /// Whether to allow drag-to-dismiss functionality in the YouTube page WebView.
  /// 
  /// Default is true.
  final bool dragToDismiss;

  /// The type of app bar to use in the YouTube page WebView.
  /// 
  /// If null, no app bar is displayed. Uses a draggable handle for dismissal instead.
  final YoutubeVideoWebviewAppBarType? appBar;

  const YoutubePageWebViewSettings({
    this.dragToDismiss = true,
    this.appBar,
  });
}
