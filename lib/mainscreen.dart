import 'package:flutter/material.dart';
import 'package:screen_capture_event/screen_capture_event.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ScreenCaptureEvent screenCaptureEvent = ScreenCaptureEvent();

  @override
  void initState() {
    screenCaptureEvent.addScreenShotListener((filePath) {
      print("ScreenShot!");
    });

    screenCaptureEvent.preventAndroidScreenShot(false);

    screenCaptureEvent.addScreenRecordListener((recorded) {
      print(recorded ? "Start Recording" : "Stop Recording");
    });

    screenCaptureEvent.watch();
    super.initState();
  }

  @override
  void dispose() {
    screenCaptureEvent.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.indigo,
      ),
    );
  }
}
