import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:slash_task/provider/product_details_provider.dart';
import 'package:slash_task/utils/const.dart';
import 'package:slash_task/utils/widget/color_container.dart';
import 'package:slash_task/utils/widget/image_slider.dart';
import '../../utils/widget/carousel_view.dart';
import '../../utils/widget/loading_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductDetailsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: Text(
          "Product details",
          style: GoogleFonts.raleway(
            fontWeight: FontWeight.w800,
          ),
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
                    productProvider
                        .products[1]
                        .variations[productProvider.colorIndex]
                        .productVariantImages
                        .length,
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
                        productProvider
                            .products[1].variations[productProvider.colorIndex],
                        productProvider.pageController,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: productProvider
                      .products[1]
                      .variations[productProvider.colorIndex]
                      .productVariantImages
                      .length,
                  itemBuilder: (context, index) {
                    return imageSlider(
                      index,
                      productProvider
                          .products[1].variations[productProvider.colorIndex],
                      productProvider,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "product name ",
                                style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                              Text(
                                "EGP 720",
                                style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 30,
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "https://i.pinimg.com/736x/0d/55/69/0d5569dd8aa0fbe7cc6ae23961de367f.jpg",
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
                                style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 23,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount:
                            productProvider.products[1].variations.length,
                        itemBuilder: (context, index) {
                          final availableProperties = productProvider
                              .products[1].availableProperties[0];

                          return ColorContainer(
                              index, availableProperties.colors![index]);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Select Size",
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Size Chart",
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 35,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: productProvider.products[1]
                                .availableProperties[0].sizes!.length,
                            itemBuilder: (context, index) {
                              final availableProperties = productProvider
                                  .products[1].availableProperties[0];
                              return GestureDetector(
                                onTap: () {
                                  productProvider.onSizeTap(index);
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: productProvider.sizeSelectedIndex ==
                                            index
                                        ? AppConst.base
                                        : Colors.black,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    availableProperties.sizes![index],
                                    style: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w600,
                                      color:
                                          productProvider.sizeSelectedIndex ==
                                                  index
                                              ? Colors.black
                                              : Colors.white,
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                width: 10,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Select Material",
                            style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: AppConst.base,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          productProvider
                              .products[1].availableProperties[0].material,
                          style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        color: Colors.white12,
                      ),
                      child: ExpansionTile(
                          shape: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                          ),
                          backgroundColor: Colors.white12,
                          iconColor: Colors.white,
                          collapsedIconColor: Colors.white,
                          childrenPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          expandedCrossAxisAlignment: CrossAxisAlignment.end,
                          title: const Text(
                            "Description",
                            style: TextStyle(color: Colors.white),
                          ),
                          children: [
                            Text(
                              productProvider.products[1].description,
                              style: const TextStyle(color: Colors.white),
                            ),
                            // This button is used to remove this item
                          ]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 35,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color?>(AppConst.base),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Add To Cart",
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
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
