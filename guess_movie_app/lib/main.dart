import 'package:flutter/material.dart';
import 'package:guess_movie/src/models/answer_model.dart';
import 'package:guess_movie/src/presentation/pages/quiz_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: ((context) => AnswerModel()),
      child: const QuizGameApp(),
    ),
  );
}

class QuizGameApp extends StatelessWidget {
  const QuizGameApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Game App',
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
      home: const QuizPage(),
    );
  }
}
