import 'package:flutter/material.dart';
import 'package:guess_movie/src/features/quiz/boxes/functions/insert_char.dart';
import 'package:guess_movie/src/models/answer_model.dart';
import 'package:guess_movie/src/features/quiz/boxes/widgets/templates/box_template.dart';
import 'package:provider/provider.dart';

Widget toAnswerBoxGenerator({
  required BuildContext context,
  required bool isLetterAdded,
  required int numberOfLetters,
  required List<String> lettersToDisplay,
}) {
  final model = context.read<AnswerModel>();
  return SizedBox(
    //height: 100,
    width: 250, //TODO change it to responsive
    child: GridView.count(
      crossAxisCount: numberOfLetters == 0
          ? 1
          : numberOfLetters ~/ 2, //TODO change it to responsive
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
        numberOfLetters,
        (index) {
          return GestureDetector(
            onTap: () {
              String? letter = getClickedLetter(index, lettersToDisplay);
              letter != null
                  ? {
                      model.manageLetter(isLetterAdded, letter, index, context),
                    }
                  : null; //TODO implement here error sound
            },
            child: BoxWithLetter(
              index: index,
              lettersToDisplay: model.validateLetters(lettersToDisplay),
              context: context,
            ),
          );
        },
      ),
    ),
  );
}
