<h1 align="center">Screenshot Callback</h1>
<h4 align="center">
  Flutter plugin that allows you to detect mobile screenshot and execute callback functions on iOS and Android.
</h4>

<div align="center">
  <a href="https://pub.dev/packages/screenshot_callback_pro">
    <img src="https://img.shields.io/pub/v/screenshot_callback_pro.svg" />
  </a>
  <img src="https://img.shields.io/github/license/LiuDongCai/screenshot_callback_pro" />
</div>

<p align="center">
  <a href="#usage">Usage</a> •
  <a href="#issues-and-feedback">Issues and Feedback</a> •
  <a href="#author">Author</a> •
  <a href="#license">License</a>
</p>

> [Feedback welcome](https://github.com/LiuDongCai/screenshot_callback_pro/issues) and [Pull Requests](https://github.com/LiuDongCai/screenshot_callback_pro/pulls) are most welcome!

## Usage

### Import the package

To use this plugin, follow the [**plugin installation instructions**](https://pub.dev/packages/screenshot_callback_pro).

### Use the plugin

Add the following import to your Dart code:

```dart
import 'package:screenshot_callback_pro/screenshot_callback_pro.dart';
```

Initialize ScreenshotCallback with the scopes you want:

```dart
ScreenshotCallbackPro screenshotCallback = ScreenshotCallbackPro();
```

### addListener

Then invoke <code>addListener</code> method of <code>ScreenshotCallback</code>.
Add custom functions that you want to excute after detect screenshot. e.g:

```dart
screenshotCallback.addListener(() {
  //Void funtions are implemented
  print('detect screenshot');
});
```

### dispose

You need to call <code>dispose</code> method to terminate <code>ScreenshotCallback</code> before you exit the app e.g:

```dart
screenshotCallback.dispose();
```

## Issues and Feedback

Please [**file**](https://github.com/LiuDongCai/screenshot_callback_pro/issues) issues to send feedback or report a bug. Thank you !

## License

MIT
