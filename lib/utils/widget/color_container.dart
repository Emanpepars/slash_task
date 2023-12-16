import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slash_task/provider/product_details_provider.dart';
import 'package:slash_task/utils/const.dart';

class ColorContainer extends StatelessWidget {
  final int index;
  final Color color;

  const ColorContainer(this.index, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductDetailsProvider>(context);
    return InkWell(
      onTap: () {
        productProvider.onColorTap(index);
      },
      child: Container(
        width: 23,
        height: 23,
        decoration: BoxDecoration(
          border: Border.all(
              color:
                  productProvider.colorIndex == index ? AppConst.base : Colors.white70,
              width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: color,
        ),
      ),
    );
  }
}
