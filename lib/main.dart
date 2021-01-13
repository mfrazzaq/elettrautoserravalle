import 'package:Serravalle/screens/splash_screen.dart';
import 'package:Serravalle/screens/webview_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Serravalle',
      theme: ThemeData(
        primaryColor: Color(0xFFB12A26),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
      routes: {WebviewScreen.routeName: (context) => WebviewScreen()},
    );
  }
}
