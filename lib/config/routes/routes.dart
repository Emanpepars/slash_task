import 'package:flutter/material.dart';

import '../../screens/product_details_screen/product_details_screen.dart';

class Routes {
  static const String productDetails = "/";
}

class AppRoutes {
  static Route onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.productDetails:
        return MaterialPageRoute(
            builder: (context) => const ProductDetailsScreen());
      default:
        return MaterialPageRoute(builder: (context) => const Text("data"));
    }
  }
}
