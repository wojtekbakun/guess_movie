import 'package:flutter/material.dart';
import 'package:guess_movie/src/presentation/pages/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          'Guess the movie',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: const Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SwitchPage(
            page: '/categoryPage',
            text: 'START',
            special: true,
          ),
          // SwitchPage(
          //   page: '/statsPage',
          //   text: 'STATISTICS',
          // ),
        ],
      )),
    );
  }
}
