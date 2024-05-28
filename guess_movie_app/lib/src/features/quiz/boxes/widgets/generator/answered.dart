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
  int numberOfColumns = model?.splitIntoWords(model.correctAnswer).length ?? 1;
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(
      numberOfColumns, //number of columns/words
      (columnIndex) {
        int numberOfRows =
            model?.splitIntoWords(model.correctAnswer)[columnIndex].length ?? 1;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            numberOfRows,
            (rowIndex) {
              int indexOfLetter =
                  model?.getIndexOfLetter(columnIndex, rowIndex) ?? 0;
              final isLetterToDisplay =
                  indexOfLetter < (numberOfLettersToDisplay);
              // debugPrint(
              //     'column: $columnIndex, row: $rowIndex,  index: $indexOfLetter');
              return AnsweredBoxesWidget(
                isLetterToDisplay: isLetterToDisplay,
                index: indexOfLetter,
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
                      model.manageLetter(
                          isLetterAdded, letter, index, false, context),
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
