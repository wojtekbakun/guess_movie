import 'package:flutter/material.dart';
import 'package:guess_movie/src/models/answer_model.dart';
import 'package:guess_movie/src/presentation/pages/category_page.dart';
import 'package:guess_movie/src/presentation/pages/home_page.dart';
import 'package:guess_movie/src/presentation/pages/level_page.dart';
import 'package:guess_movie/src/presentation/pages/quiz_page.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => AnswerModel()),
        ),
      ],
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
      initialRoute: '/homePage',
      routes: {
        '/homePage': (context) => const HomePage(),
        '/categoryPage': (context) => const CategoryPage(),
        '/levelPage': (context) => const LevelPage(),
        '/quizPage': (context) => const QuizPage(),
      },
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
        ),
        textTheme: TextTheme(
          titleMedium: GoogleFonts.prompt(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold),
          titleSmall: GoogleFonts.prompt(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 14,
              fontWeight: FontWeight.normal),
          bodyMedium: GoogleFonts.prompt(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 16,
          ),
          bodySmall: GoogleFonts.prompt(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 12,
          ),
          labelLarge: GoogleFonts.prompt(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
