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
}
