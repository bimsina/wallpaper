import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpapers/screens/home.dart';
import 'package:wallpapers/theme/theme_state.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeState>(
      create: (_) => ThemeState(),
      child: MaterialApp(
        title: 'Wallpapers',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
