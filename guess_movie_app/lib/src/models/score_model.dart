import 'package:flutter/material.dart';
import 'package:guess_movie/src/features/category_selection/categories_and_files_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizScoreModel extends ChangeNotifier {
  List<List<bool>> _answers = [];
  List<List<bool>> get answers => _answers;
  List<int> _numberOfCorrectAnswers = [];
  List<int> get numberOfCorrectAnswers => _numberOfCorrectAnswers;

  void getAllScores() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int numberOfCategories = categoriesAndFilesList.length;
    for (int categoryIndex = 0;
        categoryIndex < numberOfCategories;
        categoryIndex++) {
      int numberOfQuestions =
          int.parse(categoriesAndFilesList[categoryIndex][2]);
      for (int questionIndex = 0;
          questionIndex < numberOfQuestions;
          questionIndex++) {
        String quizScoreKey =
            'answer-category-$categoryIndex-question-$questionIndex';
        bool isCorrect = prefs.getBool(quizScoreKey) ?? false;
        // debugPrint(
        //     'category: $categoryIndex, question: $questionIndex, isCorrect: $isCorrect');
        _answers[categoryIndex][questionIndex] = isCorrect;
      }
    }
    getNumberOfCorrectAnswers();
  }

  void saveAnswerToLocalStorage(
      int categoryIndex, int questionIndex, bool isCorrect) async {
    String quizScoreKey =
        'answer-category-$categoryIndex-question-$questionIndex';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(quizScoreKey, isCorrect);
    //debugPrint('saved: $quizScoreKey, $isCorrect');
  }

  initializeScoresList() async {
    List<List<bool>> questionList = List.generate(
      categoriesAndFilesList.length,
      (_) => List<bool>.filled(int.parse(categoriesAndFilesList[_][2]), false),
    );
    _answers = questionList;
    _numberOfCorrectAnswers =
        List<int>.filled(categoriesAndFilesList.length, 0);
  }

// save the answer to the local storage and answer list
  void updateAnswer(int categoryIndex, int questionIndex, bool isCorrect) {
    _answers[categoryIndex][questionIndex] = isCorrect;
    saveAnswerToLocalStorage(categoryIndex, questionIndex, isCorrect);
    getNumberOfCorrectAnswers();
    notifyListeners();
  }

  // get number of correct answers in each category
  void getNumberOfCorrectAnswers() {
    for (int i = 0; i < _answers.length; i++) {
      _numberOfCorrectAnswers[i] = 0;
      for (int j = 0; j < _answers[i].length; j++) {
        if (_answers[i][j]) {
          _numberOfCorrectAnswers[i]++;
        }
      }
    }
  }

  void resetAnswers() {
    _answers.clear();
    // reset answers in local storage
    notifyListeners();
  }

  double getOpacity(bool isTrue) {
    if (isTrue) {
      return 1.0;
    } else {
      return 0.22;
    }
  }
}
