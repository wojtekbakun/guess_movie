import 'package:flutter/material.dart';

class ImageBox extends StatelessWidget {
  final String imageUrl;
  const ImageBox({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: Image.asset(imageUrl),
    );
  }
}
