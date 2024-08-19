import 'package:flutter/material.dart';

class ImageBox extends StatelessWidget {
  final String imageUrl;
  const ImageBox({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48.0),
      child: SizedBox(
        height: 240, // TODO: change to responsive
        width: 240,
        child: Image.asset(imageUrl),
      ),
    );
  }
}
