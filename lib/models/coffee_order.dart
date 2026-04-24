import 'cart_item.dart';

class CoffeeOrder {
  final String id;
  final List<CartItem> items;
  final double totalPrice;
  final DateTime dateTime;
  final String status;

  CoffeeOrder({
    required this.id,
    required this.items,
    required this.totalPrice,
    required this.dateTime,
    this.status = 'Completed',
  });
}
