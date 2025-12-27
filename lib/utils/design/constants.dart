part of 'package:youtube_video_webview/youtube_video_webview.dart';

class DesignConstants {
  static const double widthBase = 375.0;
  
  /// Global getter for screen width without requiring context
  static double get screenWidth {
    final view = PlatformDispatcher.instance.views.first;
    return view.physicalSize.width / view.devicePixelRatio;
  }
}