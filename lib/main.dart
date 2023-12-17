import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slash_task/provider/cart_provider.dart';
import 'package:slash_task/provider/product_details_provider.dart';
import 'app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductDetailsProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
