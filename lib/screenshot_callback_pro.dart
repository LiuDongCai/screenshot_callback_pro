import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:screenshot_callback_pro/plugin/pigeon.g.dart';
import 'package:screenshot_callback_pro/plugin/screenshot_callback_pro_plugin.dart';

class ScreenshotCallbackPro {
  /// ios
  static const MethodChannel _channel =
      const MethodChannel('flutter.ldc/screenshot_callback');

  /// android
  ScreenShotCallbackFlutterApiImp? flutterApi;
  ScreenShotCallbackHostApi? hostApi;

  List<VoidCallback> onCallbacks = <VoidCallback>[];

  /// Add void callback.
  void addListener(VoidCallback callback) {
    onCallbacks.add(callback);
  }

  ScreenshotCallbackPro() {
    if (Platform.isAndroid) {
      _initAndroid();
    } else {
      _initIos();
    }
  }

  void _initAndroid() {
    hostApi = ScreenShotCallbackHostApi();
    hostApi?.initialize();
    // listener screenshot callback.
    flutterApi = ScreenShotCallbackFlutterApiImp(
      onScreenShotCallback: () {
        for (final callback in onCallbacks) {
          callback();
        }
      },
    );
    ScreenShotCallbackFlutterApi.setup(flutterApi);
  }

  Future<void> _initIos() async {
    _channel.setMethodCallHandler(_handleIOSMethod);
    await _channel.invokeMethod('initialize');
  }

  Future<dynamic> _handleIOSMethod(MethodCall call) async {
    switch (call.method) {
      case 'onCallback':
        for (final callback in onCallbacks) {
          callback();
        }
        break;
      default:
        throw ('method not defined');
    }
  }

  /// Remove callback listener.
  Future<void> dispose() async {
    if (Platform.isAndroid) {
      final hostApi = this.hostApi;
      if (hostApi == null) return;
      return await hostApi.dispose();
    } else {
      return await _channel.invokeMethod('dispose');
    }
  }
}
