import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/product_variation.dart';
import '../const.dart';

Widget imageSlider(
  int index,
  ProductVariation productVariation,
  productProvider,
) {
  return GestureDetector(
    onTap: () {
      productProvider.onSliderTap(index);
    },
    child: Center(
      child: AnimatedContainer(
        height: 60,
        width: 60,
        margin: EdgeInsets.only(
          right: 3.w,
          left: 3.w,
          bottom: 10,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: productProvider.tappedIndex == index
                ? AppConst.base
                : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(productProvider
                .products[1].variations[productProvider.colorIndex].productVariantImages[index]),
            fit: BoxFit.cover,
          ),
        ),
        duration: const Duration(milliseconds: 200),
        // transform: Matrix4.identity()
        //   ..scale(productProvider.tappedIndex == index ? 1.1 : 1.0),
      ),
    ),
  );
}
