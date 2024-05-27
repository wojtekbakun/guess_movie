import 'package:flutter/material.dart';

class PuzzleDialog extends StatelessWidget {
  const PuzzleDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: Container(
        height: 300,
        width: 200,
        child: Column(
          children: [
            //Puzzle Counter
            PuzzleCounter(),
            // Free Puzzle
            PuzzleFree(),
            // Close Button
            CloseButton(),
          ],
        ),
      ),
    );
  }
}

class PuzzleCounter extends StatelessWidget {
  const PuzzleCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Text
          Row(
            children: [
              // Counter Text
              // Icon
            ],
          ),
        ],
      ),
    );
  }
}

class PuzzleFree extends StatelessWidget {
  const PuzzleFree({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          // Icon
          // Text
        ],
      ),
    );
  }
}

class CloseButton extends StatelessWidget {
  const CloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          // Icon
          //Text
        ],
      ),
    );
  }
}
