//Read an aswer from file
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<String> readWordFromFile(int questionId, context) async {
  try {
    String jsonString = await rootBundle.loadString('assets/questions.json');
    Map<String, dynamic> data = json.decode(jsonString);
    String word = data['answer'];
    return word;
  } catch (e) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text('An error occurred while reading the file.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
    return 'error';
  }
}

//Get mixed letters
List<String> getLetters(String word) {
  List<String> letters = word.split('');
  letters.shuffle();
  return letters;
}
