import 'package:Wallpapers/screens/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallpapers',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryIconTheme: IconThemeData(color: Colors.black),
        textTheme: TextTheme(
          headline: TextStyle(fontFamily: 'Sans', fontWeight: FontWeight.bold),
          body1: TextStyle(fontFamily: 'Sans', fontWeight: FontWeight.bold),
        ),
      ),
      home: HomePage(),
    );
  }
}
