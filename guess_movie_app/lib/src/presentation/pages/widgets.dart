import 'package:flutter/material.dart';

class SwitchPage extends StatelessWidget {
  final String page;
  final String text;
  final bool? special;
  const SwitchPage(
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
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}
