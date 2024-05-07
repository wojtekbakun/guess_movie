import 'package:flutter/material.dart';
import 'package:guess_movie/src/split_word.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: readWordFromFile(1, context),
        builder: (context, snapshot) {
          final answer = snapshot.data ?? 'dupa';
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              children: [
                answerBox(
                  context: context,
                  numberOfLetters: answer.length,
                  letters: getLetters(answer),
                ),
              ],
            );
          }
        });
  }
}

Widget answerBox({
  required BuildContext context,
  required int numberOfLetters,
  required List<String> letters,
}) {
  return GridView.count(
    crossAxisCount: 12,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    children: List.generate(numberOfLetters, (index) {
      return Container(
        height: 24,
        width: 24,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            letters[index].toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }),
  );
}

// I want to pass a word to the function and the function should fill out all boxes only with correct letters

// Pass a word to the function
// Split the word into chars
// Create a list of letters from the word
// Create a list of all letter boxes
// Create a list of answer boxes with the correct letter in the correct position
// Compare list of typed letter boxes with correct list of answer boxes
// return true if all letters are correct