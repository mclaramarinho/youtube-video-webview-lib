import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_video_webview/utils/youtube_helper.dart';
import 'package:youtube_video_webview/utils/youtube_webview_external_browser_settings.dart';
import 'package:youtube_video_webview/widgets/external_browser/youtuber_webview_external_browser.dart';

class YoutubeVideoWebview extends StatefulWidget {
  final String videoId;
  final double? height;
  final double? width;
  final String referrerHeader;
  final YoutubeWebViewExternalBrowserSettings externalBrowserSettings;
  final Map<String, String>? additionalHeaders;

  const YoutubeVideoWebview({
    required this.videoId,
    required this.referrerHeader,
    this.height,
    this.width,
    this.externalBrowserSettings =
        const YoutubeWebViewExternalBrowserSettings(),
    this.additionalHeaders,
    super.key,
  });

  @override
  State<YoutubeVideoWebview> createState() => _YoutubeVideoWebviewState();
}

class _YoutubeVideoWebviewState extends State<YoutubeVideoWebview> {
  late WebViewController controller;
  late NavigationDelegate navigationDelegate;

  Map<String, String> get youtubeHeaders => YoutubeHelper.getYoutubeHeaders(
    widget.referrerHeader,
    widget.additionalHeaders,
  );

  String get youtubeEmbedUrl =>
      YoutubeHelper.getYoutubeEmbedUrl(widget.videoId);

  double get height => widget.height ?? 200.0;
  double get width => widget.width ?? 500;

  @override
  void initState() {
    super.initState();
    controller = WebViewController();
    setNavigationDelegate();
  }

  void setNavigationDelegate() {
    navigationDelegate = NavigationDelegate(
      onNavigationRequest: (NavigationRequest request) {
        if (request.url.startsWith(YoutubeHelper.watchOnYoutubeUrlStart)) {
          YoutuberWebviewExternalBrowser.show(
            request.url,
            youtubeHeaders,
            context,
            widget.externalBrowserSettings,
          );
          return NavigationDecision.prevent;
        } else if (request.url == youtubeEmbedUrl) {
          return NavigationDecision.navigate;
        }
        return NavigationDecision.prevent;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(youtubeEmbedUrl), headers: youtubeHeaders)
      ..setNavigationDelegate(navigationDelegate);
    return SizedBox(
      height: height,
      width: width,
      child: WebViewWidget(controller: controller),
    );
  }
}
