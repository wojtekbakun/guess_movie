import 'package:flutter/material.dart';
import 'package:guess_movie/src/models/screen.dart';

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
    double screenwWitdth = ScreenSizeHelper.screenWidth;
    double boxWidth = 36;
    if (screenwWitdth < 375) {
      boxWidth = 28;
    } else if (screenwWitdth >= 414) {
      boxWidth = 32;
    }
    return Container(
      height: boxWidth, //TODO change it to responsive
      width: boxWidth, //TODO change it to responsive
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
  final List<String> lettersToDisplay;
  const BoxWithoutLetter({
    super.key,
    required this.lettersToDisplay,
  });

  @override
  Widget build(BuildContext context) {
    double screenwWitdth = ScreenSizeHelper.screenWidth;
    double boxWidth = 36;
    if (screenwWitdth < 375) {
      boxWidth = 28;
    } else if (screenwWitdth >= 414) {
      boxWidth = 32;
    }
    return Container(
      height: boxWidth, //TODO change it to responsive
      width: boxWidth, //TODO change it to responsive
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
