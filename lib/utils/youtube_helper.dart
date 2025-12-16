import 'package:share_plus/share_plus.dart';

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

  static String get shareButtonJS => '''
            document.addEventListener('share', function() {
              console.log("Shared something ");
            });
            const shareButton = document.querySelector('[class*="share"]');
            console.log("Share button:", shareButton);
            if (shareButton) {
              var old_element = shareButton;
              var new_element = old_element.cloneNode(true);
              old_element.parentNode.replaceChild(new_element, old_element);
              new_element.addEventListener('click', function(ev) {
                ev.preventDefault();
                ev.stopPropagation();
                $shareChannelName.postMessage('share_clicked');
              });
            }
          ''';
}
