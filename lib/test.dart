import 'dart:async';

import 'package:flutter/material.dart';
import 'package:perfect_volume_control/perfect_volume_control.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _textEditingController = TextEditingController();

  late StreamSubscription<double> _subscription;

  @override
  void initState() {
    super.initState();
    // Bind listener
    _subscription = PerfectVolumeControl.stream.listen((value) {
      print("llllllllllllll");
      print(value);
      _textEditingController.text = " $value+1";
    });
  }

  @override
  void dispose() {
    super.dispose();

    // Remove listener
    _subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(controller: _textEditingController),
                Container(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}