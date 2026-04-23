import 'coffee.dart';

class CartItem {
  final Coffee coffee;
  int quantity;
  String selectedSize;

  CartItem({
    required this.coffee,
    this.quantity = 1,
    this.selectedSize = 'M',
  });
}
