import 'package:flutter/material.dart';
import 'package:guess_movie/src/features/quiz/boxes/functions/insert_char.dart';
import 'package:guess_movie/src/features/quiz/boxes/widgets/templates/box_template.dart';
import 'package:guess_movie/src/models/answer_model.dart';

Widget answeredGenerator({
  required BuildContext context,
  required bool isLetterAdded,
  required int numberOfLettersToDisplay,
  required List<String> lettersToDisplay,
  required int numberOfAllLetters,
  AnswerModel? model,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(
      model?.splitIntoWords(model.correctAnswer).length ??
          1, //number of columns/words
      (columnIndex) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            model?.splitIntoWords(model.correctAnswer)[columnIndex].length ??
                1, //number of rows/characters in row
            (rowIndex) {
              int n = columnIndex > 0
                  ? model
                          ?.splitIntoWords(model.correctAnswer)[columnIndex - 1]
                          .length ??
                      1
                  : model
                          ?.splitIntoWords(model.correctAnswer)[columnIndex]
                          .length ??
                      1; //number of characters in the word
              int index =
                  columnIndex * n + rowIndex; // index of the letter in the row
              final isLetterToDisplay = index < (numberOfLettersToDisplay);
              debugPrint(
                  'n: $n, index: $index, numberOfLettersToDisplay: $numberOfLettersToDisplay');
              return AnsweredBoxesWidget(
                isLetterToDisplay: isLetterToDisplay,
                index: index,
                lettersToDisplay: lettersToDisplay,
                model: model ?? AnswerModel(),
                isLetterAdded: isLetterAdded,
              );
            },
          ),
        );
      },
    ),
  );
}

class AnsweredBoxesWidget extends StatelessWidget {
  final bool isLetterToDisplay;
  final int index;
  final List<String> lettersToDisplay;
  final AnswerModel model;
  final bool isLetterAdded;
  const AnsweredBoxesWidget({
    super.key,
    required this.isLetterToDisplay,
    required this.lettersToDisplay,
    required this.index,
    required this.model,
    required this.isLetterAdded,
  });

  @override
  Widget build(BuildContext context) {
    return isLetterToDisplay
        ? GestureDetector(
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
              lettersToDisplay: lettersToDisplay,
              context: context,
            ),
          )
        : const BoxWithoutLetter();
  }
}
