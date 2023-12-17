class CartItemModel {
  int? id;
  int productVariationId;
  int quantity;
  int productId;

  CartItemModel({
    this.id,
    required this.productVariationId,
    this.quantity = 0,
    required this.productId,
  });
}
