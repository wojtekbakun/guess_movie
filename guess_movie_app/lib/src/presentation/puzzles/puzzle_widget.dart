import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PuzzleWidget extends StatelessWidget {
  const PuzzleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 36,
      child: Stack(
        children: [
          // Rotated Puzzle Icon
          const Align(
            alignment: Alignment.centerLeft,
            child: PuzzleIcon(size: 32),
          ),
          // Counter
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(1),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: Theme.of(context).colorScheme.onPrimary,
                  width: 1,
                ),
              ),
              child: Text(
                '24',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PuzzleIcon extends StatelessWidget {
  final double size;
  const PuzzleIcon({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/puzzle.svg',
      width: size,
      height: size,
      color: Theme.of(context).colorScheme.onPrimary,
    );
  }
}
