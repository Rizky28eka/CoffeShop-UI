import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:provider/provider.dart';
import 'providers/coffee_shop_provider.dart';
import 'models/cart_item.dart';
import 'checkout_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("My Cart", style: AppStyles.subHeading),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Consumer<CoffeeShopProvider>(
        builder: (context, value, child) => value.cart.isEmpty
            ? Center(
                child: Text("Your cart is empty", style: AppStyles.body),
              )
            : ListView.builder(
                itemCount: value.cart.length,
                padding: const EdgeInsets.all(20),
                itemBuilder: (context, index) {
                  CartItem item = value.cart[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.cardBackground,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            item.coffee.imagePath,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.coffee.name, style: AppStyles.subHeading.copyWith(fontSize: 16)),
                              Text("${item.coffee.type} (${item.selectedSize})", style: AppStyles.body),
                              const SizedBox(height: 5),
                              Text("€ ${item.coffee.price}", style: AppStyles.price),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => value.decrementQuantity(item),
                              child: _buildQtyBtn(Icons.remove),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(item.quantity.toString(), style: AppStyles.subHeading.copyWith(fontSize: 16)),
                            ),
                            GestureDetector(
                              onTap: () => value.incrementQuantity(item),
                              child: _buildQtyBtn(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
      bottomNavigationBar: Consumer<CoffeeShopProvider>(
        builder: (context, value, child) => value.cart.isEmpty
            ? const SizedBox.shrink()
            : Container(
                padding: const EdgeInsets.all(25),
                decoration: const BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Price", style: AppStyles.body.copyWith(fontSize: 16)),
                        Text("€ ${value.totalPrice.toStringAsFixed(2)}", style: AppStyles.price.copyWith(fontSize: 20)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const CheckoutPage())),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text("Checkout", style: AppStyles.subHeading),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildQtyBtn(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: AppColors.white, size: 18),
    );
  }
}
