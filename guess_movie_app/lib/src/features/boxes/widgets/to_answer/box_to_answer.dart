import 'package:flutter/material.dart';
import 'package:guess_movie/src/models/answer_model.dart';
import 'package:guess_movie/src/features/boxes/widgets/generator/box_generator.dart';
import 'package:guess_movie/src/features/boxes/functions/split_and_shuffle.dart';
import 'package:provider/provider.dart';

class ToAnswerbox extends StatelessWidget {
  final String answer;
  const ToAnswerbox({
    super.key,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    final model = context.read<AnswerModel>();
    model.getAllLetters(context, getLetters(answer)); // load letters to a list
    return Consumer<AnswerModel>(
      builder: (context, value, child) => Column(
        children: [
          boxGenerator(
            context: context,
            numberOfLetters: value.toClickLetters.length,
            letters: value.toClickLetters,
            addedLetter: true,
            model: model,
          ),
        ],
      ),
    );
  }
}
