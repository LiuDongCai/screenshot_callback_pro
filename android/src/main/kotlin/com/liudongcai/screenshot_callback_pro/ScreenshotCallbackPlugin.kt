package com.liudongcai.screenshot_callback_pro

import ScreenShotCallbackFlutterApi
import android.content.Context
import android.os.Handler
import android.os.Looper
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.BinaryMessenger
import ScreenShotCallbackHostApi

class ScreenshotCallbackPlugin : MethodCallHandler, FlutterPlugin {


    private lateinit var hostApi: ScreenShotCallbackHostApiFlutterApiImplementation
    private lateinit var flutterApi: ScreenShotCallbackFlutterApi

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        flutterApi = ScreenShotCallbackFlutterApi(flutterPluginBinding.binaryMessenger)
        hostApi = ScreenShotCallbackHostApiFlutterApiImplementation(flutterPluginBinding,flutterApi)

        // initialize
        ScreenShotCallbackHostApi.setUp(
            flutterPluginBinding.binaryMessenger,
            hostApi,
        )
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {

    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    }
}

class ScreenShotCallbackHostApiFlutterApiImplementation(
    private val flutterPluginBinding: FlutterPlugin.FlutterPluginBinding,
    private var flutterApi: ScreenShotCallbackFlutterApi
) : ScreenShotCallbackHostApi{

    private var detector: ScreenshotDetector? = null
    private var lastScreenshotName: String? = null
    private var handler: Handler? = null


    override fun initialize() {
        handler = Handler(Looper.getMainLooper());
        detector = ScreenshotDetector(flutterPluginBinding.applicationContext) {
            if (handler != null && it != lastScreenshotName) {
                lastScreenshotName = it
                handler?.post {
                    flutterApi.screenShotCallback {}
                }
            }
        }

        if (detector != null) {
            detector?.start()
        }
    }


    override fun dispose() {
        if (detector != null) {
            detector?.stop()
            detector = null
            lastScreenshotName = null
        }
    }

}