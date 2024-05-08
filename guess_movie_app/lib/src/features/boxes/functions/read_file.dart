//Read an aswer from file
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guess_movie/src/models/question_model.dart';

Future<String> readWordFromFile(context) async {
  String fileUrl = 'assets/questions.json';
  try {
    String jsonString = await rootBundle.loadString(fileUrl);
    Map<String, dynamic> data = json.decode(jsonString);
    String word = data['answer'];
    debugPrint('word: $word');
    return word;
  } catch (e) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('An error occurred while reading the file.'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
    return 'Cannot read the file.';
  }
}

Future<List<QuestionModel>> loadQuestionFromJson(context) async {
  String fileUrl = 'assets/questions.json';
  try {
    String jsonString = await rootBundle.loadString(fileUrl);
    final List<dynamic> json = jsonDecode(jsonString);
    return QuestionModel.fromJsonList(json);
  } catch (e) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('An error occurred while reading the file.'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
    return [];
  }
}
