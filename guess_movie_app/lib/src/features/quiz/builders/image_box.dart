import 'package:flutter/material.dart';

class ImageBox extends StatelessWidget {
  final String imageUrl;
  const ImageBox({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double imageWidth = screenWidth / 2;
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: imageWidth,
          width: imageWidth,
          child: Image.asset(imageUrl),
        ),
      ],
    );
  }
}
