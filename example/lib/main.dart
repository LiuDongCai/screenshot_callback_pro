import 'package:flutter/material.dart';
import 'package:screenshot_callback_pro/screenshot_callback_pro.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ScreenshotCallbackPro screenshotCallback;

  String text = "Ready screenshot..";

  @override
  void initState() {
    super.initState();

    init();
  }

  void init() async {
    await initScreenshotCallback();
  }

  //It must be created after permission is granted.
  Future<void> initScreenshotCallback() async {
    screenshotCallback = ScreenshotCallbackPro();

    screenshotCallback.addListener(() {
      setState(() {
        text = "Screenshot callback success!";
      });
    });
  }

  @override
  void dispose() {
    screenshotCallback.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Detect Screenshot Callback Example'),
        ),
        body: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
