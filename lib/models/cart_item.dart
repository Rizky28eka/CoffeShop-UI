import 'coffee.dart';

class CartItem {
  final Coffee coffee;
  int quantity;
  final String selectedSize;
  final String milkType;
  final bool extraShot;

  CartItem({
    required this.coffee,
    this.quantity = 1,
    this.selectedSize = 'M',
    this.milkType = "Default",
    this.extraShot = false,
  });
}
