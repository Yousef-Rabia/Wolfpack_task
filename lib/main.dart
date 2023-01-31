import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wolfpack',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.amber,
        ),
        scaffoldBackgroundColor:Colors.white,

        primarySwatch: Colors.amber,
      ),
      home: const Home(),
    );
  }
}

// import 'dart:async';
// import 'package:perfect_volume_control/perfect_volume_control.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   TextEditingController _textEditingController = TextEditingController();
//
//   late StreamSubscription<double> _subscription;
//
//   @override
//   void initState() {
//     super.initState();
//     // Bind listener
//     _subscription = PerfectVolumeControl.stream.listen((value) {
//       _textEditingController.text = "$value";
//     });
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//
//     _subscription.cancel();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Plugin example app'),
//         ),
//         body: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TextField(controller: _textEditingController),
//                 Container(height: 10),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }