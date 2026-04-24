import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:provider/provider.dart';
import 'providers/coffee_shop_provider.dart';
import 'models/coffee_order.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("Order History", style: AppStyles.subHeading),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Consumer<CoffeeShopProvider>(
        builder: (context, value, child) => value.orders.isEmpty
            ? Center(
                child: Text("No orders yet", style: AppStyles.body),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: value.orders.length,
                itemBuilder: (context, index) {
                  CoffeeOrder order = value.orders[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: AppColors.cardBackground,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Order #${order.id.substring(order.id.length - 6)}", style: AppStyles.subHeading.copyWith(fontSize: 16)),
                            Text(order.status, style: TextStyle(color: Colors.green[400], fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const Divider(color: AppColors.secondaryText, height: 25),
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(order.items[0].coffee.imagePath, width: 60, height: 60, fit: BoxFit.cover),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${order.items.length} items", style: AppStyles.subHeading.copyWith(fontSize: 14)),
                                  Text("${order.dateTime.day}/${order.dateTime.month}/${order.dateTime.year}", style: AppStyles.body),
                                ],
                              ),
                            ),
                            Text("€ ${order.totalPrice.toStringAsFixed(2)}", style: AppStyles.price),
                          ],
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: AppColors.primary),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            child: const Text("Reorder", style: TextStyle(color: AppColors.primary)),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
