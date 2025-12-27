part of 'package:youtube_video_webview/youtube_video_webview.dart';

class ResponsiveSize {
  static double _getResponsiveWidth(double inputWidth) {
    const double baseWidth = DesignConstants.widthBase; // Base width for design reference
    return (inputWidth / baseWidth) * DesignConstants.screenWidth;
  }

  static double get x5 => _getResponsiveWidth(5);
  static double get x10 => _getResponsiveWidth(10);
  static double get x40 => _getResponsiveWidth(40);
  static double get x200 => _getResponsiveWidth(200);
  static double get x500 => _getResponsiveWidth(500);
}