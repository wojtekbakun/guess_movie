import 'package:flutter/material.dart';
import 'package:guess_movie/src/features/boxes/functions/insert_char.dart';
import 'package:guess_movie/src/models/answer_model.dart';
import 'package:guess_movie/src/features/boxes/widgets/templates/box_template.dart';

Widget boxGenerator({
  required BuildContext context,
  required int numberOfLetters,
  required List<String> letters,
  required bool addedLetter,
  AnswerModel? model,
}) {
  return GridView.count(
    crossAxisCount: 12, //!TODO change it to responsive
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    children: List.generate(numberOfLetters, (index) {
      return GestureDetector(
        onTap: () {
          String letter = getClickedLetter(index, letters);
          model?.manageLetter(addedLetter, letter, index);
          debugPrint(letter);
        },
        child: LetterBox(
          index: index,
          letters: letters,
          context: context,
        ),
      );
    }),
  );
}
