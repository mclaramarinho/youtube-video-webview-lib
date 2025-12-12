import 'package:flutter/material.dart';

abstract class YoutubeVideoWebviewAppBarType {}

class YoutubeVideoWebviewAppBarDefault extends YoutubeVideoWebviewAppBarType {}

class YoutubeVideoWebviewAppBarShare extends YoutubeVideoWebviewAppBarType {
  final String? videoId;
  final String? shareText;

  YoutubeVideoWebviewAppBarShare({this.videoId, this.shareText});
}

class YoutubeVideoWebviewAppBarCustom extends YoutubeVideoWebviewAppBarType {
  final PreferredSizeWidget appBar;
  YoutubeVideoWebviewAppBarCustom({required this.appBar});
}
