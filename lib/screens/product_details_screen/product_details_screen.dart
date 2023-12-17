import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:slash_task/config/routes/routes.dart';
import 'package:slash_task/models/cart_item_model.dart';
import 'package:slash_task/models/product_model.dart';
import 'package:slash_task/provider/product_details_provider.dart';
import 'package:slash_task/utils/app_color.dart';
import 'package:slash_task/utils/widget/button.dart';
import 'package:slash_task/utils/widget/color_container.dart';
import 'package:slash_task/utils/widget/image_slider.dart';
import 'package:slash_task/utils/widget/property_button.dart';
import '../../provider/cart_provider.dart';
import '../../utils/app_images.dart';
import '../../utils/text_styles.dart';
import '../../utils/widget/carousel_view.dart';
import '../../utils/widget/loading_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductDetailsProvider>(context);
    var cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
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
          "Product details",
          style: quicksandW800(),
        ),
      ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio: 16 / 14,
                child: PageView(
                  controller: productProvider.pageController,
                  onPageChanged: (value) {
                    productProvider.onPageChanged(value);
                  },
                  children: List.generate(
                    product.variations[productProvider.colorIndex]
                        .productVariantImages.length,
                    (index) => ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ).createShader(bounds);
                      },
                      blendMode: BlendMode.difference,
                      child: carouselView(
                        context,
                        index,
                        product.variations[productProvider.colorIndex],
                        productProvider.pageController,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 80.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: product.variations[productProvider.colorIndex]
                      .productVariantImages.length,
                  itemBuilder: (context, index) {
                    return imageSlider(
                      index,
                      product.variations[productProvider.colorIndex],
                      productProvider,
                      product,
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 72.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: quicksand25W700(),
                              ),
                              Text(
                                "EGP ${product.variations[productProvider.tappedIndex].price}",
                                style: quicksandW600(),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 30.sp,
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl: AppImages.brandLogo,
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            const Loading(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                              ),
                              Text(
                                "brand name",
                                style: quicksandW600(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    (product.availableProperties[0].colors?.length == null)
                        ? const SizedBox()
                        : SizedBox(
                            height: 18.h,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: product.variations.length,
                              itemBuilder: (context, index) {
                                final availableProperties =
                                    product.availableProperties[0];
                                return ColorContainer(
                                    index, availableProperties.colors![index]);
                              },
                              separatorBuilder: (BuildContext context, int index) => SizedBox(width: 5.w,),
                            ),
                          ),
                    SizedBox(
                      height: 20.h,
                    ),
                    (product.availableProperties[0].sizes?.length == null)
                        ? const SizedBox()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Select Size",
                                    style: quicksandW600(),
                                  ),
                                  Text(
                                    "Size Chart",
                                    style: quicksandW600(),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              SizedBox(
                                height: 35,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: product
                                      .availableProperties[0].sizes!.length,
                                  itemBuilder: (context, index) {
                                    final availableProperties =
                                        product.availableProperties[0];
                                    return PropertyButton(
                                        color:
                                            productProvider.sizeSelectedIndex ==
                                                    index
                                                ? AppConst.base
                                                : Colors.white12,
                                        text: availableProperties.sizes![index],
                                        onTap: () {
                                          productProvider.onSizeTap(index);
                                        });
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      width: 6.w,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Select Material",
                            style: quicksandW600(),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    PropertyButton(
                      color: AppConst.base,
                      text: product.availableProperties[0].material,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        color: Colors.white12,
                      ),
                      child: ExpansionTile(
                        shape: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        backgroundColor: Colors.white12,
                        iconColor: Colors.white,
                        collapsedIconColor: Colors.white,
                        childrenPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        expandedCrossAxisAlignment: CrossAxisAlignment.end,
                        title: Text(
                          "Description",
                          style: quicksandW600(),
                        ),
                        children: [
                          Text(
                            product.description,
                            style: quicksandW600(),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    Button(
                      text: "Add To Cart",
                      onPressed: () {
                        CartItemModel cartItem = CartItemModel(
                          productVariationId:
                              product.variations[productProvider.colorIndex].id,
                          productId: product.id,
                        );
                        cartProvider.addToCart(
                            cartItem,
                            product
                                .variations[productProvider.colorIndex].price);
                        Navigator.pushNamed(
                          context,
                          Routes.cart,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
