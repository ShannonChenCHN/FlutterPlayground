import 'package:flutter/material.dart';
import 'package:startup_namer/random_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(primaryColor: Colors.cyan);
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: theme,
      home: RandomWords(),
    );
  }
}
