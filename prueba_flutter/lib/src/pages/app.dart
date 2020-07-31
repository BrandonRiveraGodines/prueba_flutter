import 'package:flutter/material.dart';
import 'package:prueba_flutter/src/pages/view_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: ViewPage(),
      ),
    );
  }
}
