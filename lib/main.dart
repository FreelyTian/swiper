import 'package:flutter/material.dart';
import 'package:swiper/components/swipeArea.dart';
import 'package:swiper/pages/qrReader.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: QrReaderPage());
  }
}
