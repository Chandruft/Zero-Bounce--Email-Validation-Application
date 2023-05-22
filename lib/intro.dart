import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zero_bounce/homepage.dart';
import 'package:zero_bounce/outputbulk.dart';

import 'navbar.dart';

class intro extends StatefulWidget {
  const intro({super.key});

  @override
  State<intro> createState() => _introState();
}

class _introState extends State<intro> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 4),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) =>
              navbar(title: AutofillHints.birthday),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Lottie.asset('animations/intro.json', height: 1800, width: 1200),
          ],
        ),
      ),
    );
  }
}
