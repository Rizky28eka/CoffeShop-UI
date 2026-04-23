import 'package:flutter/material.dart';
import 'constants.dart';

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
      ),
      body: Padding(
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
            _buildTrackingStep("Order Received", "09:30 AM", true),
            _buildTrackingLine(true),
            _buildTrackingStep("Preparing your Coffee", "09:35 AM", true),
            _buildTrackingLine(true),
            _buildTrackingStep("On the way", "09:45 AM", true),
            _buildTrackingLine(false),
            _buildTrackingStep("Delivered", "Estimation 09:55 AM", false),
          ],
        ),
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
