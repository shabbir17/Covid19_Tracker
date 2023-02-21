 import 'package:covid_19_tracker_app/image_and_text_share/home.dart';
import 'package:covid_19_tracker_app/selectable_screen/selectable_screen.dart';
import 'package:covid_19_tracker_app/test_page/copy_text_clipboard.dart';
import 'package:covid_19_tracker_app/test_page/image_share_screen.dart';
import 'package:covid_19_tracker_app/test_page/share_screen.dart';
import 'package:covid_19_tracker_app/view/splash_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid 19 Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light, primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}
