# 🎬 Youtube Video Webview for Flutter (Android & iOS)
![Flutter](https://img.shields.io/badge/flutter-compatible-blue)

A customizable YouTube video player for **Flutter**, supporting embedded playback, fullscreen mode, sharing, captions, and seamless redirection to YouTube inside a webview.

---

## ✨ Features

<video controls src="features-overview.webm" title="Features overview"></video>

- 📐 Adjustable video height and width  
- 🌐 Redirects to the YouTube page inside a **webview** (via YouTube logo or video title)  
- 🖥️ Fullscreen video playback  
- 🔗 Share videos with a **custom message**  
- 💬 Caption (subtitles) control  
- ⚙️ Settings button (YouTube native menu)  
- 🧭 Multiple **AppBar options** for the redirected webview  

---

## 🚀 Getting Started

### Requirements

- **Flutter >= 1.17.0**

---

## 📦 Installation

Add the package to your `pubspec.yaml`:

```yaml
youtube_video_webview: ^1.0.0
```

Then run:
```sh
flutter pub get
```

## 🧩 Usage
### 1️⃣ Import the package
```dart
import 'package:youtube_video_webview/youtube_video_webview.dart';
```

### 2️⃣ Add the widget
```dart
YoutubeVideoWebview(
  videoId: '<VIDEO-ID>',
  referrerHeader: '<APP-IDENTIFIER-WITH-HTTPS>',
  externalBrowserSettings: YoutubePageWebViewSettings(
    appBar: YoutubeVideoWebviewAppBarShare(
      videoId: '<VIDEO-ID>',
      shareText: 'Check out this video!',
    ),
  ),
)
```

## 🌐 YouTube Page Webview Settings
Customize how the YouTube page opens when redirected:
```dart
YoutubePageWebViewSettings(
  dragToDismiss: true, // default
  appBar: YoutubeVideoWebviewAppBarShare(
    videoId: '<VIDEO-ID>',
    shareText: 'Check out this video!',
  ),
)
```

➡️ See [App Bar Options](#-app-bar-options)

## 🧭 App Bar Options

### 🔹 Default App Bar
```dart
appBar: YoutubeVideoWebviewAppBarDefault()
```

### 🔹 Share App Bar
```dart
appBar: YoutubeVideoWebviewAppBarShare(
  videoId: '<VIDEO-ID>',
  shareText: 'Check out this video!',
)
```

### 🔹 Custom App Bar
```dart
appBar: YoutubeVideoWebviewAppBarCustom(
  appBar: AppBar(
    title: const Text('Custom App Bar'),
    backgroundColor: Colors.green,
  ),
)
```

### 🔹 No App Bar (Drag to Dismiss)
```dart
dragToDismiss: true
```
ℹ️ If no AppBar is provided, drag-to-dismiss is enabled automatically.

## 🧪 Additional Information
This package is under active development, but it is already stable and ready for production use.

>🚧 More features and improvements coming soon!

## 🤝 Contributing
Found a bug or have an idea?

👉 (Suggestions & Issues)[https://github.com/mclaramarinho/youtube-video-webview-lib]

## 👤 Author
🔗 [LinkedIn](https://www.linkedin.com/in/mclaramarinho/)

💻 [GitHub](https://github.com/mclaramarinho)