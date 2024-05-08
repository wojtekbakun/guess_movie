import 'package:flutter/material.dart';

class AnswerModel extends ChangeNotifier {
  //create a list of clicked, to click letters and indexes of clicked letters
  final List<String> _clickedLetter = [];
  final List<String> _toClickLetter = [];
  final List<int> _clickedIndexes = [];

  //create getters for the lists3edx
  List<String> get clickedLetters => _clickedLetter;
  List<String> get toClickLetters => _toClickLetter;
  List<int> get clickedIndexes => _clickedIndexes;

  //after clicking a letter
  void newClickedLetter(String letter, int index) {
    _clickedLetter.add(letter);
    _toClickLetter[index] = '-';
    notifyListeners();
  }

  //after removing a letter
  void removeClickedLetter(String letter, int index) {
    _clickedLetter.remove(letter);
    _toClickLetter[clickedIndexes[index]] =
        letter; //return the letter to the original position
    notifyListeners();
  }

  //manage the letter
  void manageLetter(bool added, String letter, int indexOfClickedLetter) {
    added
        ? {
            newClickedLetter(letter, indexOfClickedLetter),
            _clickedIndexes.add(indexOfClickedLetter),
          }
        : {
            removeClickedLetter(letter, indexOfClickedLetter),
            _clickedIndexes.removeAt(indexOfClickedLetter),
          };
  }

  //load all letters and it's indexes from a word
  void getAllLetters(context, List<String> letters) {
    for (int numberOfLetter = 0;
        numberOfLetter < letters.length;
        numberOfLetter++) {
      _toClickLetter.insert(numberOfLetter, letters[numberOfLetter]);
    }
  }
}
