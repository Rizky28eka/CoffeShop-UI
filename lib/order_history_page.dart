import 'package:flutter/material.dart';
import 'constants.dart';

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
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: 5,
        itemBuilder: (context, index) {
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
                    Text("Order #1234$index", style: AppStyles.subHeading.copyWith(fontSize: 16)),
                    Text("Completed", style: TextStyle(color: Colors.green[400], fontWeight: FontWeight.bold)),
                  ],
                ),
                const Divider(color: AppColors.secondaryText, height: 25),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset("assets/images/1.jpg", width: 60, height: 60, fit: BoxFit.cover),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("2x Cappuccino", style: AppStyles.subHeading.copyWith(fontSize: 14)),
                          Text("24 April 2024, 09:30 AM", style: AppStyles.body),
                        ],
                      ),
                    ),
                    Text("€ 8.40", style: AppStyles.price),
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
                    child: Text("Reorder", style: TextStyle(color: AppColors.primary)),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
