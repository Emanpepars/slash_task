import 'package:flutter/material.dart';
import 'package:slash_task/models/product_model.dart';
import 'package:slash_task/screens/cart_screen/cart_screen.dart';
import 'package:slash_task/screens/home_screen/home_screen.dart';
import 'package:slash_task/screens/product_details_screen/product_details_screen.dart';

class Routes {
  static const String productDetails = "productDetails";
  static const String cart = "cart";
  static const String home = "/";
}

class AppRoutes {
  static Route onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.cart:
        return MaterialPageRoute(builder: (context) => const BagPage());
      case Routes.productDetails:
        Product product = routeSettings.arguments as Product;
        return MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(product));
      case Routes.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (context) => const Text("default route"));
    }
  }
}
