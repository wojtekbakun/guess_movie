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

  int calculateNumberOfColumns(int numberOfAllLetters) {
    int numberOfColumns = 0;
    numberOfAllLetters ~/ 8 > 0
        ? numberOfColumns = (numberOfAllLetters ~/ 8) + 1
        : numberOfColumns = numberOfAllLetters ~/ 8;
    return numberOfColumns;
  }

  int calculateNumberOfRows(int numberOfAllLetters, int currentColumn) {
    int numberOfRows = 0;
    int defaultNumberOfRows = 8;
    debugPrint('Number of all letters: $numberOfAllLetters');
    for (int lettersLeft = numberOfAllLetters;
        lettersLeft >= 0;
        lettersLeft -= 8) {
      if (numberOfAllLetters - (currentColumn * defaultNumberOfRows) <= 8) {
        numberOfRows =
            numberOfAllLetters - (currentColumn * defaultNumberOfRows);
      } else {
        numberOfRows = 8;
      }
    }
    debugPrint('Number of rows: $numberOfRows');
    return numberOfRows;
  }

  List<String> getLettersToDisplay() {
    List<String> letters = model.validateLetters(lettersToDisplay);
    letters.removeWhere((element) => element == ' ');
    return letters;
  }

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(
      calculateNumberOfColumns(getLettersToDisplay().length),
      (columnIndex) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            calculateNumberOfRows(getLettersToDisplay().length, columnIndex),
            (rowIndex) {
              int letterIndex = rowIndex + (columnIndex * 8);
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: GestureDetector(
                  onTap: () {
                    String? letter =
                        getClickedLetter(letterIndex, getLettersToDisplay());
                    letter != null
                        ? {
                            model.manageLetter(isLetterAdded, letter,
                                letterIndex, false, context),
                          }
                        : null; //TODO implement here error sound
                  },
                  child: BoxWithLetter(
                    index: letterIndex,
                    lettersToDisplay: getLettersToDisplay(),
                    context: context,
                  ),
                ),
              );
            },
          ),
        );
      },
    ),
  );
}
