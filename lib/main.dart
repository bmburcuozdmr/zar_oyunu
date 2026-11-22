import 'package:flutter/material.dart';
import 'screens/game_screen.dart';

void main() {
  runApp(const ZarYoluApp());
}

class ZarYoluApp extends StatelessWidget {
  const ZarYoluApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'zar yolu ',
      home: GameScreen(),
    );
  }
}
