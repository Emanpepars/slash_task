import 'package:flutter/material.dart';
import 'package:slash_task/models/product_variation.dart';
import 'package:slash_task/models/product_model.dart';
import 'package:slash_task/utils/app_images.dart';
import 'package:slash_task/utils/app_color.dart';

import '../models/product_property_and_value.dart';
import '../models/product_property.dart';

class ProductDetailsProvider extends ChangeNotifier {
  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.8);
  int pageView = 0;
  int tappedIndex = 0;
  bool isPressed = false;
  int colorIndex = 0;
  int sizeSelectedIndex = 0;

  List<Product> products = [
    Product(
      id: 1,
      name: "Denim Hoodie",
      description: "Washed Denim Spots Over sized Hoodie",
      brandId: 11,
      rating: 4.9,
      variations: [
        ProductVariation(
          id: 111,
          productId: 1,
          price: 795,
          quantity: 6,
          inStock: true,
          productVariantImages: [
            AppImages.p1,
          ],
          productPropertiesValues: [
            ProductPropertyAndValue(value: 'material', property: "Denim"),
            ProductPropertyAndValue(value: 'color', property: 'grey'),
            ProductPropertyAndValue(property: 'size', value: 'S'),
            ProductPropertyAndValue(property: 'size', value: 'M'),
            ProductPropertyAndValue(property: 'size', value: 'L'),
            ProductPropertyAndValue(property: 'size', value: 'XL'),
          ],
        ),
      ],
      availableProperties: [
        ProductProperty(
          colors: [
            Colors.grey,
          ],
          sizes: ['S', 'M', 'L', 'XL'],
          material: 'Denim',
        ),
      ],
    ),
    Product(
      id: 2,
      name: "Hoodie",
      description: "Cartoon Face Print Drop Shoulder Pullover",
      brandId: 22,
      rating: 4.9,
      variations: [
        ProductVariation(
          id: 222,
          productId: 2,
          price: 450,
          quantity: 6,
          inStock: true,
          productVariantImages: [
            AppImages.p211,
            AppImages.p212,
          ],
          productPropertiesValues: [
            ProductPropertyAndValue(property: "material", value: "cotton"),
            ProductPropertyAndValue(value: 'color', property: '0xFFCBC0B6'),
            ProductPropertyAndValue(property: 'size', value: 'S'),
            ProductPropertyAndValue(property: 'size', value: 'M'),
            ProductPropertyAndValue(property: 'size', value: 'L'),
          ],
        ),
        ProductVariation(
          id: 222,
          productId: 2,
          price: 795,
          quantity: 6,
          inStock: true,
          productVariantImages: [
            AppImages.p221,
            AppImages.p222,
          ],
          productPropertiesValues: [
            ProductPropertyAndValue(property: "material", value: "cotton"),
            ProductPropertyAndValue(value: 'color', property: '0xFFD2D0C9'),
            ProductPropertyAndValue(property: 'size', value: 'S'),
            ProductPropertyAndValue(property: 'size', value: 'M'),
            ProductPropertyAndValue(property: 'size', value: 'L'),
          ],
        ),
        ProductVariation(
          id: 222,
          productId: 2,
          price: 795,
          quantity: 6,
          inStock: true,
          productVariantImages: [
            AppImages.p231,
            AppImages.p232,
            AppImages.p233,
            AppImages.p234,
          ],
          productPropertiesValues: [
            ProductPropertyAndValue(property: "material", value: "cotton"),
            ProductPropertyAndValue(value: 'color', property: '0xFF343434'),
            ProductPropertyAndValue(property: 'size', value: 'S'),
            ProductPropertyAndValue(property: 'size', value: 'M'),
            ProductPropertyAndValue(property: 'size', value: 'L'),
          ],
        ),
        ProductVariation(
          id: 222,
          productId: 2,
          price: 795,
          quantity: 6,
          inStock: true,
          productVariantImages: [
            AppImages.p241,
            AppImages.p242,
          ],
          productPropertiesValues: [
            ProductPropertyAndValue(property: "material", value: "cotton"),
            ProductPropertyAndValue(value: 'color', property: '0xFF5E7198'),
            ProductPropertyAndValue(property: 'size', value: 'S'),
            ProductPropertyAndValue(property: 'size', value: 'M'),
            ProductPropertyAndValue(property: 'size', value: 'L'),
          ],
        ),
        ProductVariation(
          id: 222,
          productId: 2,
          price: 795,
          quantity: 6,
          inStock: true,
          productVariantImages: [
            AppImages.p251,
            AppImages.p252,
          ],
          productPropertiesValues: [
            ProductPropertyAndValue(property: "material", value: "cotton"),
            ProductPropertyAndValue(value: 'color', property: '0xFFFFFFFF'),
            ProductPropertyAndValue(property: 'size', value: 'S'),
            ProductPropertyAndValue(property: 'size', value: 'M'),
            ProductPropertyAndValue(property: 'size', value: 'L'),
          ],
        ),
        ProductVariation(
          id: 222,
          productId: 2,
          price: 795,
          quantity: 6,
          inStock: true,
          productVariantImages: [
            AppImages.p261,
            AppImages.p262,
          ],
          productPropertiesValues: [
            ProductPropertyAndValue(property: "material", value: "cotton"),
            ProductPropertyAndValue(value: 'color', property: '0xFFBD8A59'),
            ProductPropertyAndValue(property: 'size', value: 'S'),
            ProductPropertyAndValue(property: 'size', value: 'M'),
            ProductPropertyAndValue(property: 'size', value: 'L'),
          ],
        ),
      ],
      availableProperties: [
        ProductProperty(
          colors: [
            AppConst.p2c1,
            AppConst.p2c2,
            AppConst.p2c3,
            AppConst.p2c4,
            AppConst.p2c5,
            AppConst.p2c6,
          ],
          sizes: ['S', 'M', 'L'],
          material: 'Cotton',
        ),
      ],
    ),
    Product(
      id: 3,
      name: "Hoodie",
      description: "Summer Women Clothes Oversize Korean Fashion",
      brandId: 33,
      rating: 4.9,
      variations: [
        ProductVariation(
          id: 333,
          productId: 3,
          price: 800,
          quantity: 6,
          inStock: true,
          productVariantImages: [
            "assets/images/3/3.1.1.png",
            "assets/images/3/3.1.2.png",
            "assets/images/3/3.1.3.png",
          ],
          productPropertiesValues: [
            ProductPropertyAndValue(value: "color", property: "0xFF3A3C4A"),
            ProductPropertyAndValue(value: "size", property: "S"),
            ProductPropertyAndValue(value: "size", property: "M"),
            ProductPropertyAndValue(value: "size", property: "L"),
            ProductPropertyAndValue(value: "size", property: "XL"),
            ProductPropertyAndValue(value: "material", property: "cotton"),
          ],
        ),
        ProductVariation(
          id: 333,
          productId: 3,
          price: 795,
          quantity: 6,
          inStock: true,
          productVariantImages: [
            "assets/images/3/3.2.png",
          ],
          productPropertiesValues: [
            ProductPropertyAndValue(value: "color", property: "0xFF100E0A"),
            ProductPropertyAndValue(value: "size", property: "S"),
            ProductPropertyAndValue(value: "size", property: "M"),
            ProductPropertyAndValue(value: "size", property: "L"),
            ProductPropertyAndValue(value: "size", property: "XL"),
            ProductPropertyAndValue(value: "material", property: "cotton"),
          ],
        ),
        ProductVariation(
          id: 333,
          productId: 3,
          price: 795,
          quantity: 6,
          inStock: true,
          productVariantImages: [
            "assets/images/3/3.3.png",
          ],
          productPropertiesValues: [
            ProductPropertyAndValue(value: "color", property: "0xFFE8E4E3"),
            ProductPropertyAndValue(value: "size", property: "S"),
            ProductPropertyAndValue(value: "size", property: "M"),
            ProductPropertyAndValue(value: "size", property: "L"),
            ProductPropertyAndValue(value: "size", property: "XL"),
            ProductPropertyAndValue(value: "material", property: "cotton"),
          ],
        ),
      ],
      availableProperties: [
        ProductProperty(
          colors: const [
            Color(0xFF3A3C4A),
            Color(0xFF100E0A),
            Color(0xFFE8E4E3),
          ],
          sizes: ['S', 'M', 'L'],
          material: 'Cotton',
        ),
      ],
    ),
    Product(
      id: 4,
      name: "Jacket",
      description: "Reversible Oversize Fleece Hooded Jacket",
      brandId: 44,
      rating: 4.9,
      variations: [
        ProductVariation(
          id: 444,
          productId: 4,
          price: 1500,
          quantity: 6,
          inStock: true,
          productVariantImages: [
            "assets/images/4/4.1.1.png",
            "assets/images/4/4.1.2.png",
            "assets/images/4/4.1.3.png",
          ],
          productPropertiesValues: [
            ProductPropertyAndValue(value: "value", property: "property"),
          ],
        ),
        ProductVariation(
          id: 444,
          productId: 4,
          price: 795,
          quantity: 6,
          inStock: true,
          productVariantImages: [
            "assets/images/4/4.2.1.png",
            "assets/images/4/4.2.2.png",
          ],
          productPropertiesValues: [
            ProductPropertyAndValue(value: "value", property: "property"),
          ],
        ),
        ProductVariation(
          id: 444,
          productId: 4,
          price: 795,
          quantity: 6,
          inStock: true,
          productVariantImages: [
            "assets/images/4/4.3.1.png",
            "assets/images/4/4.3.2.png",
          ],
          productPropertiesValues: [
            ProductPropertyAndValue(value: "value", property: "property"),
          ],
        ),
      ],
      availableProperties: [
        ProductProperty(
          colors: const [
            Color(0xFF3A393D),
            Color(0xFF8D9195),
            Color(0xFFCFC6AA),
          ],
          sizes: ['S', 'M', 'L'],
          material: 'Cotton',
        ),
      ],
    ),
    Product(
      id: 5,
      name: "Hoodie",
      description: "Loose Solid Sweatshirt Over sized Harajuku Hoodie ",
      brandId: 55,
      rating: 4.9,
      variations: [
        ProductVariation(
          id: 555,
          productId: 5,
          price: 350,
          quantity: 6,
          inStock: true,
          productVariantImages: [
            "assets/images/5/5.1.1.png",
            "assets/images/5/5.1.2.png",
          ],
          productPropertiesValues: [
            ProductPropertyAndValue(value: "value", property: "property"),
          ],
        ),
        ProductVariation(
          id: 555,
          productId: 5,
          price: 795,
          quantity: 6,
          inStock: true,
          productVariantImages: [
            "assets/images/5/5.2.1.png",
            "assets/images/5/5.2.2.png",
          ],
          productPropertiesValues: [
            ProductPropertyAndValue(value: "value", property: "property"),
          ],
        ),
      ],
      availableProperties: [
        ProductProperty(
          colors: const [
            Color(0xFFE8E4D9),
            Color(0xFF9E766B),
          ],
          sizes: ['S', 'M', 'L'],
          material: 'Cotton',
        ),
      ],
    ),
  ];

  void onPageChanged(int value) {
    pageView = value;
    tappedIndex = value;
    notifyListeners();
  }

  void onSliderTap(int index) {
    tappedIndex = index;
    notifyListeners();
    if (pageController.hasClients) {
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastEaseInToSlowEaseOut,
      );
      notifyListeners();
    }
  }

  void onColorTap(int index) {
    colorIndex = index;
    onSliderTap(0);
    notifyListeners();
  }

  void onSizeTap(index) {
    sizeSelectedIndex = index;
    notifyListeners();
  }
}
