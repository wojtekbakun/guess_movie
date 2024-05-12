import 'package:flutter/material.dart';

class BoxWithLetter extends StatelessWidget {
  final int index;
  final List<String> lettersToDisplay;
  final BuildContext context;

  const BoxWithLetter(
      {super.key,
      required this.index,
      required this.lettersToDisplay,
      required this.context});

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 24, //TODO change it to responsive
      // width: 24, //TODO change it to responsive
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
          width: 2,
        ),
      ),
      child: Center(
        child: Text(
          lettersToDisplay[index].toUpperCase(),
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class BoxWithoutLetter extends StatelessWidget {
  const BoxWithoutLetter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 24, //TODO change it to responsive
      // width: 24, //TODO change it to responsive
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
          width: 2,
        ),
      ),
    );
  }
}
