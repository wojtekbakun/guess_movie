import 'package:flutter/material.dart';
import 'package:guess_movie/src/models/answer_model.dart';
import 'package:provider/provider.dart';

class Results extends StatelessWidget {
  const Results({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Your score is x/y!\nCongratulations!',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.normal)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/homePage');
              Provider.of<AnswerModel>(context, listen: false).toogleAnswer();
            },
            child: Text('FINISH',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.bold)),
          ),
        )
      ],
    );
  }
}
