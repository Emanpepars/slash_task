import 'package:flutter/material.dart';

import '../../models/product_variation.dart';

Widget carouselCard(context, ProductVariation productVariation, int index) {
  return Hero(
    tag: productVariation.productVariantImages[index],
    child: GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => DetailsScreen(data: data)));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
              image: AssetImage(
                productVariation.productVariantImages[index],
              ),
              fit: BoxFit.fill),
          // boxShadow: const [
          //   BoxShadow(
          //     offset: Offset(0, 4),
          //     blurRadius: 4,
          //     color: Colors.black26,
          //   ),
          // ],
        ),
      ),
    ),
  );
}
