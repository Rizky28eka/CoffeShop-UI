import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:provider/provider.dart';
import 'providers/coffee_shop_provider.dart';
import 'order_success_page.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("Checkout", style: AppStyles.subHeading),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Consumer<CoffeeShopProvider>(
        builder: (context, value, child) => SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Delivery Address", style: AppStyles.subHeading.copyWith(fontSize: 18)),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.location_on, color: AppColors.primary),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Home", style: AppStyles.subHeading.copyWith(fontSize: 16)),
                          Text("123 Coffee Street, Espresso City", style: AppStyles.body),
                        ],
                      ),
                    ),
                    const Icon(Icons.edit, color: AppColors.secondaryText, size: 20),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Text("Payment Method", style: AppStyles.subHeading.copyWith(fontSize: 18)),
              const SizedBox(height: 15),
              _buildPaymentOption("Credit Card", Icons.credit_card, true),
              _buildPaymentOption("Google Pay", Icons.account_balance_wallet, false),
              _buildPaymentOption("Apple Pay", Icons.apple, false),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    _buildSummaryRow("Subtotal", "€ ${value.totalPrice.toStringAsFixed(2)}"),
                    _buildSummaryRow("Delivery Fee", "€ 2.00"),
                    const Divider(color: AppColors.secondaryText),
                    _buildSummaryRow("Total", "€ ${(value.totalPrice + 2).toStringAsFixed(2)}", isTotal: true),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    value.checkout();
                    Navigator.push(context, MaterialPageRoute(builder: (c) => const OrderSuccessPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text("Pay Now", style: AppStyles.subHeading),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String title, IconData icon, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(15),
        border: isSelected ? Border.all(color: AppColors.primary) : null,
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.white),
          const SizedBox(width: 15),
          Text(title, style: AppStyles.subHeading.copyWith(fontSize: 16)),
          const Spacer(),
          if (isSelected) const Icon(Icons.check_circle, color: AppColors.primary),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: isTotal ? AppStyles.subHeading : AppStyles.body),
          Text(value, style: isTotal ? AppStyles.price.copyWith(fontSize: 20) : AppStyles.subHeading.copyWith(fontSize: 16)),
        ],
      ),
    );
  }
}
