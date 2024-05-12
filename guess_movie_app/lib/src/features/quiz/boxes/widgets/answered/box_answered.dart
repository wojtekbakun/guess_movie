import 'package:flutter/material.dart';
import 'package:guess_movie/src/features/quiz/boxes/widgets/generator/answered.dart';
import 'package:guess_movie/src/models/answer_model.dart';
import 'package:provider/provider.dart';

class ClickedLetterBox extends StatelessWidget {
  const ClickedLetterBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final model = context.read<AnswerModel>();
    return Consumer<AnswerModel>(
      builder: (context, value, child) => answeredBoxGenerator(
        context: context,
        numberOfLettersToDisplay: value.clickedLetters.length,
        lettersToDisplay: value.clickedLetters,
        numberOfAllLetters: model.numberOfAllLetters,
        isLetterAdded: false,
        model: model,
      ),
    );
  }
}
