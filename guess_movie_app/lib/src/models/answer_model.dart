import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:guess_movie/src/features/next_question/next_question.dart';
import 'package:guess_movie/src/features/next_question/results.dart';
import 'package:guess_movie/src/models/question_model.dart';
import 'package:guess_movie/src/models/score_model.dart';
import 'package:provider/provider.dart';

class AnswerModel extends ChangeNotifier {
  //create a list of clicked, to click letters and indexes of clicked letters
  final List<String> _clickedLetters = [];
  final List<String> _toClickLetters = [];
  final List<int> _clickedIndexes = [];

  final List<QuestionModelJson> _questionData = [];
  List<QuestionModelJson> get questionData => _questionData;

  String _correctAnswer = '';
  int _numberOfCorrectAnswerLetters = 0;
  bool _isAnswerCorrect = false;
  bool get isAnswerCorrect => _isAnswerCorrect;

  bool _isFirstAnswer = true;
  bool get isFirstAnswer => _isFirstAnswer;

  //create getters
  List<String> get clickedLetters => _clickedLetters;
  List<String> get toClickLetters => _toClickLetters;
  List<int> get clickedIndexes => _clickedIndexes;
  int get numberOfAllLetters => _numberOfCorrectAnswerLetters;
  String get correctAnswer => _correctAnswer;

  final ConfettiController _controller = ConfettiController(
    duration: const Duration(seconds: 2),
  );
  ConfettiController get controller => _controller;

  int _numberOfAllQuestions = 0;
  int get numberOfAllQuestions => _numberOfAllQuestions;
  int _numberOfQuestion = 0;
  int get numberOfQuestion => _numberOfQuestion;

  int _numberOfCategory = 0;
  int get numberOfCategory => _numberOfCategory;
  int _numberOfAllCategories = 0;
  int get numberOfAllCategories => _numberOfAllCategories;

  //after clicking a letter
  void newClickedLetter(String letter, int index) {
    _clickedLetters.add(letter.toUpperCase());
    _toClickLetters[index] = '-';
  }

  //after removing a letter
  void removeClickedLetter(String letter, int index) {
    _clickedLetters.removeAt(index);
    _toClickLetters[clickedIndexes[index]] =
        letter; //return the letter to the original position
    _clickedIndexes.removeAt(index);
    _isFirstAnswer = false;
  }

  List<String> splitIntoWords(String answer) {
    List<String> words = answer.split(' '); // Split the answer into words
    debugPrint('words: $words');
    return words; // Return the number of words
  }

  //manage the letter
  void manageLetter(bool added, String letter, int indexOfClickedLetter,
      BuildContext context) {
    added
        //if added
        ? _clickedLetters.length < _numberOfCorrectAnswerLetters
            // if there is still space for letters
            ? {
                newClickedLetter(letter, indexOfClickedLetter),
                _clickedIndexes.add(indexOfClickedLetter),
                debugPrint(
                    'indezx of clicked letter: $indexOfClickedLetter, letter: $letter, clicked letters: $_clickedLetters, clicked indexes: $_clickedIndexes'),
                _clickedLetters.length == _numberOfCorrectAnswerLetters
                    ? checkIfAnswerIsCorrect()
                        ? {
                            playConfetti(controller),
                          }
                        : null //TODO add a message that the answer is incorrect
                    : null //TODO add a message that there is no more space for letters
              }
            //if there is no more space for letters
            : null
        //if deleted
        : {
            removeClickedLetter(letter, indexOfClickedLetter),
          };
    notifyListeners();
  }

  //load all letters and it's indexes from a word
  void initializeLetters() {
    String? word = questionData[numberOfQuestion].answer ?? 'error';
    if (_clickedLetters.isEmpty && isFirstAnswer) {
      _correctAnswer = word.toUpperCase();
      _numberOfCorrectAnswerLetters = word.length;
      for (int numberOfLetter = 0;
          numberOfLetter < word.length;
          numberOfLetter++) {
        _toClickLetters.insert(
            numberOfLetter, word[numberOfLetter].toUpperCase());
      }
      _toClickLetters.removeWhere((element) => element == ' ');
      _toClickLetters.addAll(generateRandomLetters(word.length.isEven));
      _toClickLetters.shuffle();
      debugPrint('zainicjowano litery: _toClickLetters: $_toClickLetters');
    }
  }

  void initializeQuestionsList(List<QuestionModelJson> questionData) {
    _questionData.addAll(questionData);
    getNumberOfAllQuestions();
  }

  void getNumberOfAllQuestions() {
    _numberOfAllQuestions = questionData.length;
    debugPrint('Number of all questions: $_numberOfAllQuestions');
  }

  void getNumberOfAllCategories(int categoriesCount) {
    _numberOfAllCategories = categoriesCount;
    debugPrint('Number of all questions: $_numberOfAllQuestions');
  }

  List<String> validateLetters(List<String> letters) {
    List<String> lettersToPrint;
    lettersToPrint =
        letters.map((letter) => letter == '-' ? '' : letter).toList();
    return lettersToPrint;
  }

  List<String> generateRandomLetters(bool isWordLenghtEven) {
    int howManyLettersToGenerate = 0;
    List<String> randomLetters = [];
    howManyLettersToGenerate = isWordLenghtEven ? 4 : 3;
    randomLetters = String.fromCharCodes(List.generate(
            howManyLettersToGenerate, (index) => Random().nextInt(25) + 97))
        .toUpperCase()
        .split('');
    return randomLetters;
  }

  bool checkIfAnswerIsCorrect() {
    bool isAnswerCorrect;
    List<String> typedAnswer = _clickedLetters;
    List<String> correctAnswer = _correctAnswer.split('');
    typedAnswer.removeWhere((element) => element == ' ');
    isAnswerCorrect = typedAnswer.join() == correctAnswer.join() ? true : false;
    _isAnswerCorrect = isAnswerCorrect;
    return isAnswerCorrect;
  }

  void toogleAnswer() {
    clearTables();
    _isAnswerCorrect = false;
    _isFirstAnswer = true;
    debugPrint('toogled');
  }

  void clearTables() {
    _clickedLetters.clear();
    _toClickLetters.clear();
    _clickedIndexes.clear();
    //  clearQuestionData();
  }

  void clearQuestionData() {
    _questionData.clear();
  }

  void playConfetti(ConfettiController controller) {
    controller.play();
  }

  void nextQuestion(BuildContext context) {
    toogleAnswer();
    Provider.of<QuizScoreModel>(context, listen: false)
        .updateAnswer(_numberOfCategory, _numberOfQuestion, true);
    Navigator.pop(context);
    _numberOfQuestion++;
    initializeLetters();
    notifyListeners();
    debugPrint('clicked next question');
  }

  Widget showNextQuestionDialog(BuildContext context) {
    //show next question only if there is a next question
    //(number of question is iterated in nextQuestion method after closing the dialog)

    if (_numberOfQuestion + 1 < _numberOfAllQuestions) {
      Future.delayed(
        const Duration(milliseconds: 0),
        () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const Dialog(
                child: NextQuestionWidget(),
              );
            },
          );
        },
      );
    } else {
      Future.delayed(
        const Duration(milliseconds: 0),
        () {
          // toogleAnswer();
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const Dialog(
                child: Results(),
              );
            },
          );
        },
      );
    }

    return const SizedBox.shrink();
  }

  void setCategoryNumber(int categoryNumber) {
    _numberOfCategory = categoryNumber;
    debugPrint('Category Clicked: ${_numberOfCategory + 1}');
  }

  void setQuestionNumber(int questionNumber) {
    _numberOfQuestion = questionNumber;
    debugPrint('Category Clicked: ${_numberOfQuestion + 1}');
  }
}
