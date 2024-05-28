import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PuzzleModel extends ChangeNotifier {
  int _puzzleCount = 0;
  int get puzzleCount => _puzzleCount;
  bool get isPuzzleAvailable => _puzzleCount > 0;

  void decrementPuzzleCount() {
    if (isPuzzleAvailable) {
      _puzzleCount--;
    }
    // notifyListeners();
  }

  void incrementPuzzleCount() {
    _puzzleCount++;
    notifyListeners();
  }

  // void hintLetter(String letter, int indexOfLetterToHint) {

  // }

  // bool checkIfCurrentLettersAreCorrect() {
  //   List<String> typedLetters = _clickedLetters.toList();
  //   List<String> correctLetters =
  //       _correctAnswer.split('').take(typedLetters.length).toList();
  //   typedLetters.removeWhere((element) => element == ' ');
  //   correctLetters.removeWhere((element) => element == ' ');
  //   bool isLettersCorrect =
  //       typedLetters.join() == correctLetters.join() ? true : false;
  //   return isLettersCorrect;
  // }
}
