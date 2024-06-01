import 'dart:math';
import 'package:flutter/material.dart';
import 'package:guess_movie/src/features/quiz/boxes/widgets/answered/box_answered.dart';
import 'package:guess_movie/src/features/quiz/boxes/widgets/to_answer/box_to_answer.dart';
import 'package:guess_movie/src/features/quiz/builders/image_box.dart';
import 'package:guess_movie/src/models/answer_model.dart';
import 'package:guess_movie/src/models/question_model.dart';
import 'package:provider/provider.dart';
import 'package:confetti/confetti.dart';

class QuizBuilder extends StatelessWidget {
  final QuestionModelJson questionData;

  const QuizBuilder({super.key, required this.questionData});

  @override
  Widget build(BuildContext context) {
    final answerModel = Provider.of<AnswerModel>(context, listen: false);
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageBox(
              imageUrl: questionData.imageUrl ?? '',
            ),
            const ClickedLetterBox(),
            const ToAnswerbox(),
            ElevatedButton(
              onPressed: () {
                answerModel.useHint(context);
              },
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                backgroundColor: Theme.of(context).colorScheme.onSurface,
              ),
              child: Center(
                child: Text(
                  'Get Hint',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ],
        ),
        ConfettiWidget(
          confettiController: answerModel.controller,
          blastDirection: pi / 4,
          numberOfParticles: 20,
          minBlastForce: 10,
        ),
        Consumer<AnswerModel>(
          builder: (context, answerData, child) {
            if (answerData.isAnswerCorrect) {
              debugPrint('Correct answer');
              answerData.showNextQuestionDialog(context);
              return const SizedBox.shrink();
            } else {
              return const SizedBox
                  .shrink(); // return an empty box when `isAnswerCorrect` is false
            }
          },
        ),
      ],
    );
  }
}
