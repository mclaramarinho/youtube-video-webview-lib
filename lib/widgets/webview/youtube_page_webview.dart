
part of 'package:youtube_video_webview/youtube_video_webview.dart';

class YoutuberPageWebview {
  static void show(
    String url,
    Map<String, String> youtubeHeaders,
    BuildContext context,
    YoutubePageWebViewSettings settings,
  ) {
    final webviewController = WebViewController();
    webviewController
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(url), headers: youtubeHeaders);
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      barrierColor: Colors.transparent,
      enableDrag: true,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              if (settings.appBar == null) ...[
                const YoutubeWebviewDragHandle(),
              ],
              if (settings.appBar != null) ...[
                YoutubeWebviewAppBar(
                  appBarType:
                      settings.appBar ?? YoutubeVideoWebviewAppBarDefault(),
                ),
              ],
              Expanded(child: WebViewWidget(controller: webviewController)),
            ],
          ),
        );
      },
    );
  }
}
