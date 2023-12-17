import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slash_task/provider/product_details_provider.dart';
import 'package:slash_task/utils/app_color.dart';

import '../../config/routes/routes.dart';
import '../../provider/cart_provider.dart';
import '../../utils/text_styles.dart';
import '../../utils/widget/product_cart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductDetailsProvider>(context);
    var cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Text(
          "Home Screen",
          style: quicksandW800(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Badge(
              backgroundColor: AppConst.base,
              alignment: Alignment.topCenter,
              label: Text(
                '${cartProvider.cartItems.length}',
                style: quicksandW600(color: Colors.black,size: 13),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.cart);
                },
                icon: const Icon(
                  Icons.shopping_cart,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productProvider.products.length,
        itemBuilder: (context, index) {
          return ProductCard(product: productProvider.products[index]);
        },
      ),
    );
  }
}
