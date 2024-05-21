import 'package:flutter/material.dart';
import 'package:guess_movie/src/features/quiz/builders/quiz_builder.dart';
import 'package:guess_movie/src/models/answer_model.dart';
import 'package:guess_movie/src/models/question_model.dart';
import 'package:guess_movie/src/presentation/my_app_bar/widgets/my_app_bar.dart';
import 'package:provider/provider.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: myAppBar(context, quitQuiz: true),
      body: SafeArea(
        child: Consumer<AnswerModel>(builder: (context, answerData, child) {
          answerData.initializeLetters();
          debugPrint('zdupa');
          return QuizBuilder(
            questionData: answerData.questionData[answerData.numberOfQuestion],
          );
        }),
      ),
    );
  }
}
