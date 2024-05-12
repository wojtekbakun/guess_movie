import 'package:flutter/material.dart';
import 'package:guess_movie/src/models/answer_model.dart';
import 'package:provider/provider.dart';

class NextQuestionWidget extends StatelessWidget {
  const NextQuestionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final answerData = Provider.of<AnswerModel>(context, listen: false);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Correct answer!',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.normal)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => answerData.nextQuestion(context),
            child: Text('NEXT QUESTION',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.bold)),
          ),
        )
      ],
    );
  }
}
