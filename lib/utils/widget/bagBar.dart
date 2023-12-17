import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:slash_task/models/cart_item_model.dart';
import 'package:slash_task/provider/cart_provider.dart';
import 'package:slash_task/provider/product_details_provider.dart';
import 'package:slash_task/utils/app_color.dart';
import 'package:slash_task/utils/text_styles.dart';

class BagBar extends StatelessWidget {
  final CartItemModel cartItem;
  final VoidCallback callback;

  const BagBar({
    super.key,
    required this.cartItem,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    var productProvider = Provider.of<ProductDetailsProvider>(context);
    return Card(
      color: Colors.white12,
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: callback,
                child: Container(
                  width: 100.w,
                  height: 90.h,
                  margin: EdgeInsets.only(right: 11.w),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4),
                        bottomLeft: Radius.circular(4)),
                    image: DecorationImage(
                      image: AssetImage(productProvider
                          .products[cartItem.productId - 1]
                          .variations[0]
                          .productVariantImages[0]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 10.h, right: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productProvider.products[cartItem.productId - 1].name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: quicksand16W600(),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          InkWell(
                            // Decrease Icon
                            onTap: () {
                              cartProvider.onTabDecIcon(
                                productProvider,
                                cartItem,
                              );
                            },
                            child: Container(
                              height: 22.h,
                              width: 25.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                color: AppConst.base,
                              ),
                              child: Icon(
                                Icons.remove,
                                size: 18.sp,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            "${cartItem.quantity}",
                            style: quicksandW600(size: 20.sp),
                          ),
                          SizedBox(width: 8.w),
                          InkWell(
                            // Increase Icon
                            onTap: () {
                              cartProvider.onTabIncIcon(
                                  productProvider, cartItem);
                            },
                            child: Container(
                              height: 22.h,
                              width: 25.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(200),
                                  color: AppConst.base),
                              child: Icon(
                                Icons.add,
                                size: 18.sp,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          if (cartItem.quantity > 1) ...[
                            Expanded(
                              child: Text(
                                "${cartItem.quantity * productProvider.products[cartItem.productId - 1].variations[productProvider.colorIndex].price}\$",
                                style: quicksandW600(),
                              ),
                            ),
                          ]
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: RichText(
                          text: TextSpan(
                            text: "Product Price:",
                            style: quicksandW600(size: 14),
                            children: [
                              TextSpan(
                                  text:
                                      "\t\t\t${productProvider.products[cartItem.productId - 1].variations[productProvider.colorIndex].price}\$",
                                  style: quicksandW600())
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
