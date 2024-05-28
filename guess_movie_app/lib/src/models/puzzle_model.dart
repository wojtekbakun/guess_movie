import 'package:flutter/material.dart';

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
}
