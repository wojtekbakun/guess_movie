import 'package:flutter/material.dart';
import 'package:guess_movie/src/models/answer_model.dart';
import 'package:guess_movie/src/presentation/puzzles/puzzle_dialog.dart';
import 'package:guess_movie/src/presentation/puzzles/puzzle_widget.dart';
import 'package:provider/provider.dart';

PreferredSizeWidget myAppBar(BuildContext context, {bool? quitQuiz}) {
  return AppBar(
    backgroundColor: Theme.of(context).colorScheme.onSurface,
    title: Text(
      'Visual Quest',
      style: Theme.of(context).textTheme.titleMedium,
    ),
    leading: IconButton(
      icon: Icon(
        Icons.close,
        color: Theme.of(context).colorScheme.onSecondary,
      ),
      onPressed: () {
        Navigator.of(context).pop();
        quitQuiz ?? false
            ? Provider.of<AnswerModel>(context, listen: false).toogleAnswer()
            : null;
      },
    ),
    actions: [
      IconButton(
        icon: const PuzzleWidget(),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const PuzzleDialog();
            },
          );
        },
      )
    ],
  );
}
