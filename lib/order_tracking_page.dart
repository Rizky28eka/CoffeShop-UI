import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:provider/provider.dart';
import 'providers/coffee_shop_provider.dart';

class OrderTrackingPage extends StatelessWidget {
  const OrderTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("Track Order", style: AppStyles.subHeading),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.white),
          onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
        ),
      ),
      body: Consumer<CoffeeShopProvider>(
        builder: (context, value, child) {
          if (value.orders.isEmpty) {
            return Center(child: Text("No active orders", style: AppStyles.body));
          }
          final latestOrder = value.orders.first;

          return Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(radius: 25, backgroundImage: AssetImage("assets/images/1.jpg")),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Dedi (Driver)", style: AppStyles.subHeading.copyWith(fontSize: 16)),
                            Text("On the way to your location", style: AppStyles.body),
                          ],
                        ),
                      ),
                      const Icon(Icons.call, color: AppColors.primary),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                _buildTrackingStep("Order Received", "${latestOrder.dateTime.hour}:${latestOrder.dateTime.minute}", true),
                _buildTrackingLine(true),
                _buildTrackingStep("Preparing your Coffee", "Just now", true),
                _buildTrackingLine(true),
                _buildTrackingStep("On the way", "In a moment", true),
                _buildTrackingLine(false),
                _buildTrackingStep("Delivered", "Estimation 15 mins", false),
                const Spacer(),
                Text("Order #${latestOrder.id.substring(latestOrder.id.length - 6)}", style: AppStyles.body),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTrackingStep(String title, String time, bool isCompleted) {
    return Row(
      children: [
        Icon(
          isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
          color: isCompleted ? AppColors.primary : AppColors.secondaryText,
          size: 24,
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppStyles.subHeading.copyWith(fontSize: 16, color: isCompleted ? AppColors.white : AppColors.secondaryText)),
            Text(time, style: AppStyles.body),
          ],
        ),
      ],
    );
  }

  Widget _buildTrackingLine(bool isCompleted) {
    return Container(
      margin: const EdgeInsets.only(left: 11),
      height: 40,
      width: 2,
      color: isCompleted ? AppColors.primary : AppColors.secondaryText.withValues(alpha: 0.3),
    );
  }
}
