import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:slash_task/models/cart_item_model.dart';

class CartProvider with ChangeNotifier {
  final List<CartItemModel> _cartItems = [];

  List<CartItemModel> get cartItems => _cartItems;
  double totalAmount = 0;

  void addToCart(CartItemModel cartItemModel, price) {
    if (cartItems.any((element) => element.id == cartItemModel.productId)) {
      Fluttertoast.showToast(
          msg: "Quantity Increased",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black.withOpacity(0.8),
          textColor: Colors.white,
          fontSize: 16.0);
      cartItemModel.quantity++;
      totalAmount = price + totalAmount;
      notifyListeners();
    } else {
      cartItemModel.quantity++;
      cartItems.add(cartItemModel);
      Fluttertoast.showToast(
          msg: "Item added in cart",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black.withOpacity(0.8),
          textColor: Colors.white,
          fontSize: 16.0);
      totalAmount = price + totalAmount;
      notifyListeners();
    }
    notifyListeners();
  }

  void onTabIncIcon(productProvider, productItem) {
    productItem.quantity++;
    totalAmount =
        productProvider.products[productItem.productId].variations[0].price +
            totalAmount;
    notifyListeners();
  }

  void onTabDecIcon(productProvider, CartItemModel productItem) {
    productItem.quantity--;
    if (totalAmount != 0) {
      totalAmount = totalAmount -
          productProvider.products[productItem.productId].variations[0].price;
      notifyListeners();
    }

    if (productItem.quantity == 0) {
      cartItems.remove(productItem);
      notifyListeners();
    }
    notifyListeners();
  }
}
