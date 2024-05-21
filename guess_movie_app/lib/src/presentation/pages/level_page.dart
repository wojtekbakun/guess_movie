import 'package:flutter/material.dart';
import 'package:guess_movie/src/features/quiz/boxes/functions/read_file.dart';
import 'package:guess_movie/src/models/answer_model.dart';
import 'package:guess_movie/src/models/question_model.dart';
import 'package:guess_movie/src/presentation/my_app_bar/widgets/my_app_bar.dart';
import 'package:provider/provider.dart';

class LevelPage extends StatelessWidget {
  const LevelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadQuestionFromJson(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          // TODO add error handling
          final error = snapshot.error.toString();
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            body: Center(
              child: Text('Error: $error'),
            ),
          );
        } else {
          Provider.of<AnswerModel>(context, listen: false)
              .initializeQuestionsList(
                  snapshot.data as List<QuestionModelJson>);
          return Scaffold(
            appBar: myAppBar(context),
            body: SafeArea(
              child: GridView.builder(
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // number of items in a row
                  //childAspectRatio: 3 / 2, // ratio of item width to height
                  crossAxisSpacing: 24, // spacing between items horizontally
                  mainAxisSpacing: 24, // spacing between items vertically
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                itemBuilder: (context, index) {
                  return LevelPanel(
                    levelNumber: index,
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}

class LevelPanel extends StatelessWidget {
  final int levelNumber;
  const LevelPanel({
    super.key,
    required this.levelNumber,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Provider.of<AnswerModel>(context, listen: false)
            .setQuestionNumber(levelNumber);
        Navigator.pushNamed(
          context,
          '/quizPage',
        );
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      minVerticalPadding: 24,
      tileColor: Theme.of(context).colorScheme.primary,
      title: Text(
        (levelNumber + 1).toString(),
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
