import 'package:flutter/material.dart';
import 'package:guess_movie/src/presentation/quiz_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Game',
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme(
            primary: Color.fromRGBO(157, 101, 201, 100),
            secondary: Color.fromRGBO(215, 137, 215, 100),
            surface: Color.fromRGBO(157, 101, 201, 100),
            background: Color.fromRGBO(42, 61, 102, 100),
            error: Colors.red,
            onPrimary: Colors.white,
            onSecondary: Colors.white,
            onSurface: Colors.black,
            onBackground: Colors.black,
            onError: Colors.white,
            brightness: Brightness.light,
          )),
      home: const Scaffold(
        body: QuizPage(),
      ),
    );
  }
}
