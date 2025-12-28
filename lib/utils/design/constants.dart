part of 'package:youtube_video_webview/youtube_video_webview.dart';

/// Design-related constants and helpers used across the package.
class DesignConstants {
  /// Base design width used for responsive calculations.
  static const double widthBase = 375.0;

  /// Returns the current logical screen width without requiring a [BuildContext].
  static double get screenWidth {
    final view = PlatformDispatcher.instance.views.first;
    return view.physicalSize.width / view.devicePixelRatio;
  }
}
