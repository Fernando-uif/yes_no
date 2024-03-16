import 'package:flutter/material.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/presentation/screens/chat/chart_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'yes or no app',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 4).theme(),
      home: const ChatScreen(),
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: const Text('Material App Bar'),
      //   ),
      //   body: Center(
      //     child: FilledButton.tonal(
      //         onPressed: () {}, child: const Text('Click me')),
      //   ),
      // ),
    );
  }
}
