import 'package:flutter/material.dart';

class ProductProperty {
  List<Color>? colors;

  List<String>? sizes;

  String material;

  ProductProperty({
    this.colors,
    this.sizes,
    required this.material,
  });
}
