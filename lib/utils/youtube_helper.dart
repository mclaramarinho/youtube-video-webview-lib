part of 'package:youtube_video_webview/youtube_video_webview.dart';

class YoutubeHelper {
  static String getYoutubeEmbedUrl(String videoId) {
    return 'https://www.youtube.com/embed/$videoId?rel=0&showinfo=0&autoplay=0';
  }

  static String getShareUrl(String videoId) {
    return 'https://www.youtube.com/watch?v=$videoId';
  }

  static String get watchOnYoutubeUrlStart =>
      'https://www.youtube.com/watch?v=';

  static Map<String, String> getYoutubeHeaders(
    String referrer, [
    Map<String, String>? additionalHeaders,
  ]) {
    return {'Referer': referrer, ...?additionalHeaders};
  }

  static showShareDialog(String videoId, String? shareText) {
    final useText = shareText != null;

    SharePlus.instance.share(
      ShareParams(
        uri: !useText ? Uri.parse(YoutubeHelper.getShareUrl(videoId)) : null,
        text: useText
            ? "$shareText ${YoutubeHelper.getShareUrl(videoId)}"
            : null,
      ),
    );
  }

  static const String shareChannelName = "ShareChannel";

  static String get shareButtonJS =>
      '''
        window.addEventListener("touchend", (ev) => {
          const currentTarget = ev.target;
          const parent = currentTarget.parentElement;
          if (!parent) return;
          const parentParent = parent.parentElement;
          if (!parentParent) return;

          const ariaLabel = parentParent.ariaLabel || "";
          if (!ariaLabel.toLowerCase().includes('share')) return;

          ev.preventDefault();
          ev.stopPropagation();
          $shareChannelName.postMessage('share_clicked');
        })

      ''';
}
