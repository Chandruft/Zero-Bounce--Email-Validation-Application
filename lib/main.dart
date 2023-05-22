import 'package:flutter/material.dart';
import 'package:zero_bounce/intro.dart';
import 'package:zero_bounce/navbar.dart';
import 'package:zero_bounce/outputbulk.dart';
import 'package:zero_bounce/widgets/info2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: intro(),
    );
  }
}
