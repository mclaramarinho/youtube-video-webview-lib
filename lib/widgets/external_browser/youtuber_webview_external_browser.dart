import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_video_webview/utils/youtube_webview_app_bar_type.dart';
import 'package:youtube_video_webview/utils/youtube_webview_external_browser_settings.dart';
import 'package:youtube_video_webview/widgets/app_bar/youtube_webview_app_bar.dart';
import 'package:youtube_video_webview/widgets/drag_handle/youtube_webview_drag_handle.dart';

class YoutuberWebviewExternalBrowser {
  static void show(
    String url,
    Map<String, String> youtubeHeaders,
    BuildContext context,
    YoutubeWebViewExternalBrowserSettings settings,
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
