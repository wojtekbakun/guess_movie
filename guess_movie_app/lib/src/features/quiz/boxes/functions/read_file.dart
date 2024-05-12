//Read an aswer from file
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guess_movie/src/features/category_selection/categories_and_files_list.dart';
import 'package:guess_movie/src/models/answer_model.dart';
import 'package:guess_movie/src/models/question_model.dart';
import 'package:provider/provider.dart';

Future<List<QuestionModelJson>> loadQuestionFromJson(context) async {
  final model = Provider.of<AnswerModel>(context, listen: false);
  final int categoryNumber = model.numberOfCategory;
  String fileUrl = categoriesAndFilesList[categoryNumber][1];
  try {
    String jsonString = await rootBundle.loadString(fileUrl);
    final List<dynamic> json = jsonDecode(jsonString);
    return QuestionModelJson.fromJsonList(json);
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
