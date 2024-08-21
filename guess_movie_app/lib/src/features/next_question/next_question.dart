import 'package:flutter/material.dart';
import 'package:guess_movie/src/models/answer_model.dart';
import 'package:guess_movie/src/models/puzzle_model.dart';
import 'package:provider/provider.dart';

class NextQuestionWidget extends StatelessWidget {
  const NextQuestionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final answerData = Provider.of<AnswerModel>(context, listen: false);
    final puzzleModel = context.read<PuzzleModel>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Correct answer!',
              style: Theme.of(context).textTheme.bodySmall),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {
              answerData.nextQuestion(context);
              puzzleModel.incrementPuzzleCount(1);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('NEXT QUESTION',
                  style: Theme.of(context).textTheme.titleMedium),
            ),
          ),
        )
      ],
    );
  }
}
