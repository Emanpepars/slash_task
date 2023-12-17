import 'package:flutter/material.dart';
import 'package:slash_task/utils/app_color.dart';
import 'package:slash_task/utils/text_styles.dart';

import '../../config/routes/routes.dart';
import '../../models/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white12,
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage:
                AssetImage(product.variations[0].productVariantImages.first),
            radius: 30.0,
          ),
          title: Text(
            product.name,
            style: quicksand16W600(),
          ),
          subtitle: Text(
            product.description,
            style: quicksandW600(color: Colors.white70, size: 13),
          ),
          trailing: Text(
            '\$${product.variations[0].price.toStringAsFixed(2)}',
            style: quicksandW600(color: AppConst.base),
          ),
          onTap: () {
            Navigator.pushNamed(context, Routes.productDetails,
                arguments: product);
          },
        ),
      ),
    );
  }
}
