import 'package:flutter/material.dart';
import '../models/coffee.dart';
import '../models/cart_item.dart';

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

  // Favorites
  List<Coffee> get favorites => _shop.where((c) => c.isFavorite).toList();

  // Points
  double _userPoints = 2450;

  // Getters
  List<Coffee> get shop => _shop;
  List<CartItem> get cart => _userCart;
  double get userPoints => _userPoints;

  // Total Price
  double get totalPrice {
    double total = 0;
    for (var item in _userCart) {
      total += double.parse(item.coffee.price) * item.quantity;
    }
    return total;
  }

  // Actions
  void addToCart(Coffee coffee, {String size = 'M'}) {
    // Check if already in cart
    var existingItem = _userCart.firstWhere(
      (item) => item.coffee.id == coffee.id && item.selectedSize == size,
      orElse: () => CartItem(coffee: coffee, quantity: 0, selectedSize: size),
    );

    if (existingItem.quantity > 0) {
      existingItem.quantity++;
    } else {
      _userCart.add(CartItem(coffee: coffee, selectedSize: size));
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
    // Logic for checkout (e.g., adding to history, clearing cart)
    _userPoints += (totalPrice * 10); // Reward 10 points per Euro
    _userCart.clear();
    notifyListeners();
  }
}
