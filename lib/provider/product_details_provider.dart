import 'package:flutter/material.dart';
import 'package:slash_task/models/product_variation.dart';
import 'package:slash_task/models/product_model.dart';

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
            "assets/images/1/1.png",
          ],
          productPropertiesValues: [
            ProductPropertyAndValue(value: 'material', property: "Denim"),
            ProductPropertyAndValue(value: 'color', property: 'grey'),
            ProductPropertyAndValue(property: 'size', value: 'S'),
            ProductPropertyAndValue(property: 'size', value: 'M'),
            ProductPropertyAndValue(property: 'size', value: 'L'),
          ],
        ),
      ],
      availableProperties: [
        ProductProperty(
          colors: [
            Colors.grey,
            Colors.red,
            Colors.green,
            Colors.yellow,
          ],
          sizes: ['S', 'M', 'L'],
          material: 'Denim',
        ),
      ],
    ),
    Product(
      id: 2,
      name: "Hoodie",
      description: "Washed Denim Spots Over sized Hoodie",
      brandId: 22,
      rating: 4.9,
      variations: [
        ProductVariation(
          id: 222,
          productId: 2,
          price: 795,
          quantity: 6,
          inStock: true,
          productVariantImages: [
            "assets/images/2/2.1.1.png",
            "assets/images/2/2.1.2.png",
          ],
          productPropertiesValues: [
            ProductPropertyAndValue(property: "material", value: "cotton"),
            ProductPropertyAndValue(value: 'color', property: 'grey'),
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
            "assets/images/2/2.2.1.png",
            "assets/images/2/2.2.2.png",
          ],
          productPropertiesValues: [
            ProductPropertyAndValue(property: "material", value: "cotton"),
            ProductPropertyAndValue(value: 'color', property: 'grey'),
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
            "assets/images/2/2.3.1.png",
            "assets/images/2/2.3.2.png",
            "assets/images/2/2.3.3.png",
            "assets/images/2/2.3.4.png",
          ],
          productPropertiesValues: [
            ProductPropertyAndValue(property: "material", value: "cotton"),
            ProductPropertyAndValue(value: 'color', property: 'grey'),
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
            "assets/images/2/2.4.1.png",
            "assets/images/2/2.4.2.png",
          ],
          productPropertiesValues: [
            ProductPropertyAndValue(property: "material", value: "cotton"),
            ProductPropertyAndValue(value: 'color', property: 'grey'),
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
            "assets/images/2/2.5.1.png",
            "assets/images/2/2.5.2.png",
          ],
          productPropertiesValues: [
            ProductPropertyAndValue(property: "material", value: "cotton"),
            ProductPropertyAndValue(value: 'color', property: 'grey'),
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
            "assets/images/2/2.6.1.png",
            "assets/images/2/2.6.2.png",
          ],
          productPropertiesValues: [
            ProductPropertyAndValue(property: "material", value: "cotton"),
            ProductPropertyAndValue(value: 'color', property: 'grey'),
            ProductPropertyAndValue(property: 'size', value: 'S'),
            ProductPropertyAndValue(property: 'size', value: 'M'),
            ProductPropertyAndValue(property: 'size', value: 'L'),
          ],
        ),
      ],
      availableProperties: [
        ProductProperty(
          colors: const [
            Color(0xFFCBC0B6),
            Color(0xFFD2D0C9),
            Color(0xB5000000),
            Color(0xFF5E7198),
            Color(0xFFFFFFFF),
            Color(0xFFBD8A59),
          ],
          sizes: ['S', 'M', 'L'],
          material: 'Cotton',
        ),
      ],
    ),
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
            "assets/images/1/1.png",
          ],
          productPropertiesValues: [
            ProductPropertyAndValue(value: "value", property: "property"),
          ],
        ),
      ],
      availableProperties: [
        ProductProperty(
          colors: [
            Colors.grey,
            Colors.yellow,
            Colors.blue,
            Colors.green,
            Colors.red,
            Colors.pink
          ],
          sizes: ['S', 'M', 'L'],
          material: 'Cotton',
        ),
      ],
    ),
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
            "assets/images/1/1.png",
          ],
          productPropertiesValues: [
            ProductPropertyAndValue(value: "value", property: "property"),
          ],
        ),
      ],
      availableProperties: [
        ProductProperty(
          colors: [
            Colors.grey,
            Colors.yellow,
            Colors.blue,
            Colors.green,
            Colors.red,
            Colors.pink
          ],
          sizes: ['S', 'M', 'L'],
          material: 'Cotton',
        ),
      ],
    ),
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
            "assets/images/1/1.png",
          ],
          productPropertiesValues: [
            ProductPropertyAndValue(value: "value", property: "property"),
          ],
        ),
      ],
      availableProperties: [
        ProductProperty(
          colors: [
            Colors.grey,
            Colors.yellow,
            Colors.blue,
            Colors.green,
            Colors.red,
            Colors.pink
          ],
          sizes: ['S', 'M', 'L'],
          material: 'Cotton',
        ),
      ],
    ),
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
            "assets/images/1/1.png",
          ],
          productPropertiesValues: [
            ProductPropertyAndValue(property: "material", value: "cotton"),
            ProductPropertyAndValue(property: "material", value: "cotton"),
            ProductPropertyAndValue(property: "material", value: "cotton"),
          ],
        ),
      ],
      availableProperties: [
        ProductProperty(colors: [], material: 'cotton'),
      ],
    ),
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
            "assets/images/1/1.png",
          ],
          productPropertiesValues: [
            ProductPropertyAndValue(value: "value", property: "property"),
          ],
        ),
      ],
      availableProperties: [
        ProductProperty(material: 'cotton'),
      ],
    ),
  ];

  void onPageChanged(int value) {
    pageView = value;
    onSliderTap(value);
    notifyListeners();
  }

  void onSliderTap(int index) {
    tappedIndex = index;
    notifyListeners();
    if (pageController.hasClients) {
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      notifyListeners();
    }
  }

  void onColorTap(int index) {
    colorIndex = index;
    notifyListeners();
  }

  onSizeTap(index) {
    sizeSelectedIndex = index;
    notifyListeners();
  }
}
