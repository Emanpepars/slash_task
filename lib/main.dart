import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slash_task/provider/product_details_provider.dart';
import 'app.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context)=> ProductDetailsProvider(),
      child: const MyApp()));
}


