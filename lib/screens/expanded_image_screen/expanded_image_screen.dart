import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  final String imageTag;
  final String imageUrl;

  const ImageScreen(
      {super.key, required this.imageTag, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Hero(
            tag: imageTag,
            child: Image.asset(
              imageUrl,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
