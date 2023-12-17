import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:slash_task/provider/cart_provider.dart';
import 'package:slash_task/utils/text_styles.dart';
import 'package:slash_task/utils/widget/button.dart';

import '../../utils/widget/bagBar.dart';

class BagPage extends StatefulWidget {
  const BagPage({Key? key}) : super(key: key);

  @override
  State<BagPage> createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {
  void state() => setState(() {});

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: Text(
          "My Cart",
          style: quicksandW800(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: cartProvider.cartItems.isEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ColorFiltered(
                              colorFilter: const ColorFilter.mode(
                                Colors.black,
                                BlendMode.hue,
                              ),
                              child: Lottie.asset(
                                  "animation/ecommerce_Bag.json",
                                  width: double.infinity,
                                  fit: BoxFit.fill),
                            ),
                            Text("No Items in your Cart",
                                style: quicksand16W600()),
                          ],
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: ((context, index) {
                            final item = cartProvider.cartItems[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 26.0),
                              child: BagBar(
                                cartItem: item,
                                callback: () {},
                              ),
                            );
                          }),
                          itemCount: cartProvider.cartItems.length,
                        ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total amount : ",
                    style: quicksandW600(size: 14),
                  ),
                  Text(
                    "${cartProvider.totalAmount}\$",
                    style: quicksandW600(),
                  )
                ],
              ),
              const Button(
                text: 'Checkout',
              ),
            ]),
      ),
    );
  }
}
