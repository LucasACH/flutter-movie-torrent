import 'package:flutter/material.dart';

import 'homePage.dart';
import 'darkTheme.dart';
import 'restartWidget.dart';

void main() {
  runApp(RestartWidget(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme(),
      home: HomePage(),
    );
  }
}
