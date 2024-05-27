import 'package:flutter/material.dart';
import 'package:guess_movie/src/models/answer_model.dart';
import 'package:guess_movie/src/models/score_model.dart';
import 'package:guess_movie/src/models/screen.dart';
import 'package:guess_movie/src/presentation/pages/category_page.dart';
import 'package:guess_movie/src/presentation/pages/home_page.dart';
import 'package:guess_movie/src/presentation/pages/level_page.dart';
import 'package:guess_movie/src/presentation/pages/quiz_page.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const Loader());
}

class Loader extends StatelessWidget {
  const Loader({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => AnswerModel()),
        ),
        ChangeNotifierProvider(
          create: ((context) => QuizScoreModel()),
        ),
      ],
      child: const QuizGameApp(),
    );
  }

  // Future<void> _initializeScores(BuildContext context) async {}
}

class QuizGameApp extends StatelessWidget {
  const QuizGameApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Provider.of<QuizScoreModel>(context, listen: false).initializeScoresList();
    Provider.of<QuizScoreModel>(context, listen: false).getAllScores();
    ScreenSizeHelper.initialize(context);
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
          titleMedium: TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          titleSmall: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            color: Theme.of(context).colorScheme.surface,
          ),
          // bodyMedium: TextStyle(
          //   fontFamily: 'Inter',
          //   fontSize: 18,
          //   color: Theme.of(context).colorScheme.onPrimary,
          // ),
          bodySmall: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          labelLarge: TextStyle(
            fontFamily: 'Inter',
            fontSize: 18,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
