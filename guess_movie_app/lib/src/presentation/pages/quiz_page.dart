import 'package:flutter/material.dart';
import 'package:guess_movie/src/features/boxes/functions/read_file.dart';
import 'package:guess_movie/src/features/boxes/widgets/answered/box_answered.dart';
import 'package:guess_movie/src/features/boxes/widgets/to_answer/box_to_answer.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadQuestionFromJson(context),
      builder: (context, snapshot) {
        final questionData = snapshot.data ?? []; // !TODO add error handling
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    'Question: ${questionData[0].question ?? 'Cannot get the question.'}'),
                const ClickedLetterBox(),
                ToAnswerbox(
                  answer: questionData[0].answer ?? 'Error',
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
