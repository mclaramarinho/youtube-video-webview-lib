// import 'package:flutter/material.dart';
part of 'package:youtube_video_webview/youtube_video_webview.dart';

/// Defines the types of app bars available for the YouTube video WebView.
abstract class YoutubeVideoWebviewAppBarType {}

/// A default app bar with a close button.
class YoutubeVideoWebviewAppBarDefault extends YoutubeVideoWebviewAppBarType {}

/// An app bar with a close and a share button.
class YoutubeVideoWebviewAppBarShare extends YoutubeVideoWebviewAppBarType {
  /// The YouTube video ID to be shared.
  /// 
  /// Refer to [YoutubeVideoWebview] for more details.
  final String? videoId;

  /// The text to be shared along with the video link.
  final String? shareText;

  YoutubeVideoWebviewAppBarShare({this.videoId, this.shareText});
}

/// A custom app bar provided by the user.
class YoutubeVideoWebviewAppBarCustom extends YoutubeVideoWebviewAppBarType {
  /// The custom app bar widget.
  final PreferredSizeWidget appBar;
  
  YoutubeVideoWebviewAppBarCustom({required this.appBar});
}
