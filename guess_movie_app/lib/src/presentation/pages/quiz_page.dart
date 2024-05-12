import 'package:flutter/material.dart';
import 'package:guess_movie/src/features/quiz/builders/quiz_builder.dart';
import 'package:guess_movie/src/models/answer_model.dart';
import 'package:guess_movie/src/models/question_model.dart';
import 'package:guess_movie/src/presentation/my_app_bar/widgets/my_app_bar.dart';
import 'package:provider/provider.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as List<QuestionModelJson>;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: myAppBar(context, quitQuiz: true),
      body: SafeArea(
        child: Consumer<AnswerModel>(builder: (context, answerData, child) {
          answerData.getNumberOfAllQuestions(args.length);
          return QuizBuilder(
            questionData: args[answerData.numberOfQuestion],
          );
        }),
      ),
    );
  }
}
