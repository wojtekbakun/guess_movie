import 'package:flutter/material.dart';
import 'package:guess_movie/src/models/answer_model.dart';
import 'package:guess_movie/src/features/quiz/boxes/widgets/generator/to_answer.dart';

import 'package:provider/provider.dart';

class ToAnswerbox extends StatelessWidget {
  const ToAnswerbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AnswerModel>(
      builder: (context, value, child) => Column(
        children: [
          toAnswerBoxGenerator(
            context: context,
            numberOfLetters: value.toClickLetters.length,
            lettersToDisplay: value.toClickLetters,
            isLetterAdded: true,
          ),
        ],
      ),
    );
  }
}
