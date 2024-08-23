import 'package:pigeon/pigeon.dart';

// https://github.com/flutter/packages/blob/main/packages/pigeon/example/README.md
@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/plugin/pigeon.g.dart',
  dartOptions: DartOptions(),
  kotlinOut:
      'android/src/main/kotlin/com/liudongcai/screenshot_callback_pro/ScreenShotCallbackProGeneratedApis.g.kt',
  kotlinOptions: KotlinOptions(
      // https://github.com/fluttercommunity/wakelock_plus/issues/18
      errorClassName: "ScreenShotCallbackProFlutterError"),
  // swiftOut: 'ios/Classes/SwiftScreenshotCallbackPlugin.g.swift',
  // swiftOptions: SwiftOptions(),
  dartPackageName: 'screenshot_callback_pro',
))
@HostApi()
abstract class ScreenShotCallbackHostApi {
  /// 初始化
  void initialize();

  /// 销毁
  void dispose();
}

@FlutterApi()
abstract class ScreenShotCallbackFlutterApi {
  /// 截图回调
  void screenShotCallback();
}
