import 'package:flutter/material.dart';
import 'package:guess_movie/src/models/puzzle_model.dart';
import 'package:guess_movie/src/presentation/puzzles/puzzle_widget.dart';
import 'package:provider/provider.dart';

class PuzzleDialog extends StatelessWidget {
  const PuzzleDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).colorScheme.onSurface.withOpacity(1),
      child: const SizedBox(
        height: 300,
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
      // color: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // Text
          Text(
            'YOU HAVE:',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Counter Text
              Consumer<PuzzleModel>(
                builder: (context, puzzle, child) {
                  return Text(
                    '${puzzle.puzzleCount}',
                    style: Theme.of(context).textTheme.labelLarge,
                  );
                },
              ),
              // Icon
              const PuzzleIcon(size: 48),
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
    final puzzleModel = context.read<PuzzleModel>();
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ElevatedButton(
        onPressed: puzzleModel.incrementPuzzleCount,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  Icons.wallet_giftcard_sharp,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              // Text
              Text(
                'FREE PUZZLE',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CloseButton extends StatelessWidget {
  const CloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.close,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            //Text
            Text(
              'Close',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
