import 'dart:convert';

class Cart {
  final int id_product;
  int quantity;

// Getter cho id_product
  int get productId => id_product;

  // Getter cho quantity
  int get cartQuantity => quantity;

  Cart({required this.id_product, required this.quantity});

  // Convert a Breed into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id_product': id_product,
      'quantity': quantity,
    };
  }

  void increaseQuan() {
    quantity = quantity + 1;
  }

  void increaseQuanNum(int quan) {
    quantity = quantity + quan;
  }

  void decreaseQuan() {
    if (quantity > 1) quantity = quantity - 1;
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      id_product: map['id_product']?.toInt() ?? 0,
      quantity: map['quantity']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) => Cart.fromMap(json.decode(source));

  // Implement toString to make it easier to see information about
  // each breed when using the print statement.
  @override
  String toString() => 'Cart(id_product: $id_product, quantity: $quantity)';
}
