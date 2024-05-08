import 'package:flutter/material.dart';
import 'package:guess_movie/src/models/answer_model.dart';
import 'package:guess_movie/src/features/boxes/widgets/generator/box_generator.dart';
import 'package:provider/provider.dart';

class ClickedLetterBox extends StatelessWidget {
  const ClickedLetterBox({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<AnswerModel>();
    return Consumer<AnswerModel>(
      builder: (context, value, child) => boxGenerator(
        context: context,
        numberOfLetters: value.clickedLetters.length,
        letters: value.clickedLetters,
        addedLetter: false,
        model: model,
      ),
    );
  }
}
