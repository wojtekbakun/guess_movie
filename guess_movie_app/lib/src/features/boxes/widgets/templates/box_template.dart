import 'package:flutter/material.dart';

class LetterBox extends StatelessWidget {
  final int index;
  final List<String> letters;
  final BuildContext context;

  const LetterBox(
      {super.key,
      required this.index,
      required this.letters,
      required this.context});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24, //!TODO change it to responsive
      width: 24, //!TODO change it to responsive
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
          letters[index].toUpperCase(),
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
