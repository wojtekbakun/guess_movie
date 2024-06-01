import 'package:flutter/material.dart';
import 'package:guess_movie/src/features/category_selection/categories_and_files_list.dart';
import 'package:guess_movie/src/models/answer_model.dart';
import 'package:guess_movie/src/models/score_model.dart';
import 'package:guess_movie/src/presentation/my_app_bar/widgets/my_app_bar.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: ListView.builder(
          itemCount: categoriesAndFilesList.length,
          shrinkWrap: false,
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return CategoryPanel(
              index: index,
            );
          },
        ),
      ),
    );
  }
}

class CategoryPanel extends StatelessWidget {
  final int index;
  const CategoryPanel({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, '/levelPage');
          Provider.of<AnswerModel>(context, listen: false).clearQuestionData();
          Provider.of<AnswerModel>(context, listen: false)
              .setCategoryNumber(index);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        minVerticalPadding: 24,
        tileColor: Theme.of(context).colorScheme.primary,
        leading: Container(
          height: 60,
          width: 60,
          color: Colors.grey,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.arrow_right_rounded,
              size: 24,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            Consumer<QuizScoreModel>(builder: (context, answerData, child) {
              return Text(
                '${answerData.numberOfCorrectAnswers[index]}/${categoriesAndFilesList[index][2]}',
                style: Theme.of(context).textTheme.bodySmall,
              );
            })
          ],
        ),
        title: Text(
          'Level ${index + 1}',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(
          categoriesAndFilesList[index][0],
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
