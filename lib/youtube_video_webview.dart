import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:ui';
import 'package:share_plus/share_plus.dart';

part 'utils/design/constants.dart';
part 'utils/design/responsive_size.dart';
part 'utils/youtube_helper.dart';
part 'utils/youtube_page_webview_settings.dart';
part 'utils/youtube_webview_app_bar_type.dart';
part 'widgets/webview/youtube_page_webview.dart';
part 'widgets/app_bar/youtube_webview_app_bar.dart';
part 'widgets/drag_handle/youtube_webview_drag_handle.dart';

/// A WebView widget to display a YouTube video by its video ID.
class YoutubeVideoWebview extends StatefulWidget {
  /// The YouTube video ID to be displayed.
  /// 
  /// For example, for the URL `https://www.youtube.com/embed/ssRIT1OwdWE`,
  /// the video ID is `ssRIT1OwdWE`.
  final String videoId;

  /// The height of the WebView. If not provided, a default height is used.
  /// 
  /// Default is 200 logical pixels.
  final double? height;

  /// The width of the WebView. If not provided, a default width is used.
  /// 
  /// Default is 500 logical pixels.
  final double? width;

  /// The referrer header to be included in the WebView requests.
  /// 
  /// This is important for YouTube to allow embedding.
  /// 
  /// For example, use `https://com.yourapp.domain` as the referrer.
  /// 
  /// If not provided, youtube might block the video from being displayed.
  final String referrerHeader;

  /// Settings for the external browser when opening YouTube links.
  /// 
  /// Default is an instance of [YoutubePageWebViewSettings] with default values.
  final YoutubePageWebViewSettings externalBrowserSettings;

  /// Additional headers to be included in the WebView requests.
  /// 
  /// `Referer` header is added by default using [referrerHeader].
  final Map<String, String>? additionalHeaders;

  const YoutubeVideoWebview({
    required this.videoId,
    required this.referrerHeader,
    this.height,
    this.width,
    this.externalBrowserSettings =
        const YoutubePageWebViewSettings(),
    this.additionalHeaders,
    super.key,
  });

  @override
  State<YoutubeVideoWebview> createState() => _YoutubeVideoWebviewState();
}

class _YoutubeVideoWebviewState extends State<YoutubeVideoWebview> {
  late WebViewController controller;
  late NavigationDelegate navigationDelegate;
  bool builtOnce = false;
  bool addedEventToShareButton = false;

  Map<String, String> get youtubeHeaders => YoutubeHelper.getYoutubeHeaders(
    widget.referrerHeader,
    widget.additionalHeaders,
  );

  String get youtubeEmbedUrl =>
      YoutubeHelper.getYoutubeEmbedUrl(widget.videoId);

  double get height => widget.height ?? ResponsiveSize.x200;
  double get width => widget.width ?? ResponsiveSize.x500;

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
          YoutuberPageWebview.show(
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
      onPageFinished: (url) {
        addedEventToShareButton = true;
        controller.runJavaScript(YoutubeHelper.shareButtonJS);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBarShare =
        widget.externalBrowserSettings.appBar is YoutubeVideoWebviewAppBarShare
        ? widget.externalBrowserSettings.appBar
              as YoutubeVideoWebviewAppBarShare
        : null;
    final useText = appBarShare?.shareText != null;

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(youtubeEmbedUrl), headers: youtubeHeaders)
      ..addJavaScriptChannel(
        YoutubeHelper.shareChannelName,
        onMessageReceived: (JavaScriptMessage message) {
          YoutubeHelper.showShareDialog(
            widget.videoId,
            useText ? appBarShare!.shareText : null,
          );
        },
      )
      ..setNavigationDelegate(navigationDelegate);

    return SizedBox(
      height: height,
      width: width,
      child: WebViewWidget(controller: controller),
    );
  }
}
