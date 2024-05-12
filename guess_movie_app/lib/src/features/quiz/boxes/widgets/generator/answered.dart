import 'package:flutter/material.dart';
import 'package:guess_movie/src/features/quiz/boxes/functions/insert_char.dart';
import 'package:guess_movie/src/features/quiz/boxes/widgets/templates/box_template.dart';
import 'package:guess_movie/src/models/answer_model.dart';

Widget answeredBoxGenerator({
  required BuildContext context,
  required bool isLetterAdded,
  required int numberOfLettersToDisplay,
  required List<String> lettersToDisplay,
  required int numberOfAllLetters,
  AnswerModel? model,
}) {
  return SizedBox(
    //alignment: Alignment.center,
    height: 50, //TODO change it to responsive
    width: 250, //TODO change it to responsive
    //color: Colors.amber,
    child: GridView.count(
      crossAxisCount: numberOfAllLetters, //TODO change it to responsive
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
        numberOfAllLetters,
        (index) {
          final isLetterToDisplay = index < numberOfLettersToDisplay;
          return isLetterToDisplay
              ? GestureDetector(
                  onTap: () {
                    String? letter = getClickedLetter(index, lettersToDisplay);
                    letter != null
                        ? {
                            model?.manageLetter(
                                isLetterAdded, letter, index, context),
                          }
                        : null; //TODO implement here error sound
                  },
                  child: BoxWithLetter(
                    index: index,
                    lettersToDisplay: lettersToDisplay,
                    context: context,
                  ),
                )
              : const BoxWithoutLetter();
        },
      ),
    ),
  );
}
