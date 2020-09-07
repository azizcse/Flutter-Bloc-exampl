import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_widgets/common/routes.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int delay = 0;

  @override
  void initState() {
    Timer(Duration(seconds: 5), () => caller());
    super.initState();
  }

  void caller() {
    setState(() {
      delay = 5;
    });
    Timer(Duration(seconds: 1),()=>Navigator.pushReplacementNamed(context, Routes.main));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: delay == 0
            ? CircularProgressIndicator()
            : Text("Hello"),
      ),
    );
  }
}
