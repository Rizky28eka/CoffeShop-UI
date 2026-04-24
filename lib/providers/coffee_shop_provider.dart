import 'package:flutter/material.dart';
import '../models/coffee.dart';
import '../models/cart_item.dart';
import '../models/coffee_order.dart';

class CoffeeShopProvider extends ChangeNotifier {
  // Catalog
  final List<Coffee> _shop = [
    Coffee(
      id: '1',
      name: 'Cappuccino',
      type: 'With Oat Milk',
      price: '4.20',
      imagePath: 'assets/images/1.jpg',
      rating: 4.8,
      description: 'A classic cappuccino with a smooth oat milk finish.',
    ),
    Coffee(
      id: '2',
      name: 'Black Coffee',
      type: 'Strong & Pure',
      price: '2.30',
      imagePath: 'assets/images/2.jpg',
      rating: 4.5,
      description: 'Premium dark roast for the ultimate energy boost.',
    ),
    Coffee(
      id: '3',
      name: 'Latte',
      type: 'Creamy Delight',
      price: '5.10',
      imagePath: 'assets/images/3.jpg',
      rating: 4.9,
      description: 'Rich espresso mixed with steamed milk for a silky texture.',
    ),
  ];

  // User Cart
  final List<CartItem> _userCart = [];

  // Order History
  final List<CoffeeOrder> _userOrders = [];

  // Favorites
  List<Coffee> get favorites => _shop.where((c) => c.isFavorite).toList();

  // Points
  double _userPoints = 2450;

  // Getters
  List<Coffee> get shop => _shop;
  List<CartItem> get cart => _userCart;
  List<CoffeeOrder> get orders => _userOrders;
  double get userPoints => _userPoints;

  // Total Price
  double get totalPrice {
    double total = 0;
    for (var item in _userCart) {
      double basePrice = double.parse(item.coffee.price);
      if (item.selectedSize == 'L') basePrice += 1.0;
      if (item.selectedSize == 'S') basePrice -= 0.5;
      if (item.extraShot) basePrice += 0.5;
      total += basePrice * item.quantity;
    }
    return total;
  }

  // Actions
  void addToCart(Coffee coffee, {String size = 'M', String milkType = "Default", bool extraShot = false}) {
    // Check if item already exists with SAME customizations
    bool itemFound = false;
    for (var item in _userCart) {
      if (item.coffee.id == coffee.id && item.selectedSize == size && item.milkType == milkType && item.extraShot == extraShot) {
        item.quantity++;
        itemFound = true;
        break;
      }
    }

    if (!itemFound) {
      _userCart.add(CartItem(
        coffee: coffee,
        selectedSize: size,
        milkType: milkType,
        extraShot: extraShot,
      ));
    }
    notifyListeners();
  }

  void removeFromCart(CartItem item) {
    _userCart.remove(item);
    notifyListeners();
  }

  void incrementQuantity(CartItem item) {
    item.quantity++;
    notifyListeners();
  }

  void decrementQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      _userCart.remove(item);
    }
    notifyListeners();
  }

  void toggleFavorite(Coffee coffee) {
    coffee.isFavorite = !coffee.isFavorite;
    notifyListeners();
  }

  void checkout() {
    // Save to history
    final newOrder = CoffeeOrder(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      items: List.from(_userCart),
      totalPrice: totalPrice + 2, // including delivery
      dateTime: DateTime.now(),
    );
    _userOrders.insert(0, newOrder);

    // Update points
    _userPoints += (totalPrice * 10);
    _userCart.clear();
    notifyListeners();
  }
}
