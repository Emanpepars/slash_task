import 'dart:math';

import 'package:flutter/material.dart';

import '../../models/product_variation.dart';
import 'carousel_card.dart';

Widget carouselView(
    context, int index, ProductVariation product, pageController) {
  return AnimatedBuilder(
    animation: pageController,
    builder: (context, child) {
      double value = 0.0;
      if (pageController.position.haveDimensions) {
        value = index.toDouble() - (pageController.page ?? 0);
        value = (value * 0.038).clamp(-1, 1);
      }
      return Transform.rotate(
        angle: pi * value,
        child: carouselCard(context, product, index),
      );
    },
  );
}
