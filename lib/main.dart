import 'package:flutter/material.dart';
import 'package:xo_play/board_screen.dart';
import 'package:xo_play/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'X&O Play',
     debugShowCheckedModeBanner: false,
      routes: {
      HomePage.routeName: (_) =>HomePage(),
      BoardScreen.routeName: (_) =>BoardScreen()

      },
    initialRoute: HomePage.routeName,
    );
  }
}