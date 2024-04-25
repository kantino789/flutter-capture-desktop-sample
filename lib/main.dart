import 'dart:js_interop';

import 'package:chrome_extension/desktop_capture.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _record() {
    chrome.desktopCapture.chooseDesktopMedia(
        [
          DesktopCaptureSourceType.screen,
          DesktopCaptureSourceType.tab,
          DesktopCaptureSourceType.window
        ],
        null,
        null,
        ((String streamId, JSObject options) {
          print('Callback: $streamId');
        }).toJS);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: const Center(
          child: Text(
            'Click button to record',
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _record,
          tooltip: 'Record',
          child: const Text("Record"),
        ));
  }
}
