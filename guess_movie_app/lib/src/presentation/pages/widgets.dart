import 'package:flutter/material.dart';

class SwitchPageButton extends StatelessWidget {
  final String page;
  final String text;
  final bool? special;
  const SwitchPageButton(
      {super.key, required this.page, required this.text, this.special});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: special ?? false
            ? MaterialStatePropertyAll(Theme.of(context).colorScheme.primary)
            : MaterialStatePropertyAll(Theme.of(context).colorScheme.secondary),
        //   elevation: const MaterialStatePropertyAll(4),
      ),
      onPressed: () {
        Navigator.pushNamed(context, page);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
