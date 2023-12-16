import 'package:flutter/material.dart';

import '../../models/product_variation.dart';
import '../../screens/product_details_screen/expanded_image_screen/expanded_image_screen.dart';

Widget carouselCard(context, ProductVariation productVariation, int index) {
  return Hero(
    tag: "imageTag_${productVariation.productVariantImages[index]}",
    // Unique tag for each image
    child: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImageScreen(
              imageTag:
                  "imageTag_${productVariation.productVariantImages[index]}",
              imageUrl: productVariation.productVariantImages[index],
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
            image: AssetImage(productVariation.productVariantImages[index]),
            fit: BoxFit.fill,
          ),
        ),
      ),
    ),
  );
}
