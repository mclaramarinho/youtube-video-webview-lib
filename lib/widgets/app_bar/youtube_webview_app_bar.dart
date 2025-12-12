import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:youtube_video_webview/utils/youtube_helper.dart';
import 'package:youtube_video_webview/utils/youtube_webview_app_bar_type.dart';

class YoutubeWebviewAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final YoutubeVideoWebviewAppBarType appBarType;

  const YoutubeWebviewAppBar({required this.appBarType, super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  List<Widget>? get actions {
    if (appBarType is YoutubeVideoWebviewAppBarShare) {
      final appBarShare = appBarType as YoutubeVideoWebviewAppBarShare;
      final useText = appBarShare.shareText != null;

      return [
        IconButton(
          icon: const Icon(Icons.share),
          onPressed: () {
            SharePlus.instance.share(
              ShareParams(
                uri: !useText && appBarShare.videoId != null
                    ? Uri.parse(YoutubeHelper.getShareUrl(appBarShare.videoId!))
                    : null,
                text: useText
                    ? "${appBarShare.shareText} ${appBarShare.videoId != null ? " ${YoutubeHelper.getShareUrl(appBarShare.videoId!)}" : ""}"
                    : null,
              ),
            );
          },
        ),
      ];
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    if (appBarType is YoutubeVideoWebviewAppBarCustom) {
      return (appBarType as YoutubeVideoWebviewAppBarCustom).appBar;
    }

    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: actions,
    );
  }
}
