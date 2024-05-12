import 'package:flutter/material.dart';
import 'package:guess_movie/src/models/answer_model.dart';
import 'package:provider/provider.dart';

PreferredSizeWidget myAppBar(BuildContext context, {bool? quitQuiz}) {
  return AppBar(
      title: Text(
        'Quiz Game App',
        style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
      ),
      leading: IconButton(
        icon: Icon(
          Icons.close,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        onPressed: () {
          Navigator.of(context).pop();
          quitQuiz ?? false
              ? Provider.of<AnswerModel>(context, listen: false).clearTables()
              : null;
        },
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.pie_chart,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          onPressed: () {},
        )
      ]);
}
