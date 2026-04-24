import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:lottie/lottie.dart';
import 'order_tracking_page.dart';

class OrderSuccessPage extends StatelessWidget {
  const OrderSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.network(
                'https://lottie.host/85532515-5628-4034-8c87-8e6f1f3e742c/D5bK5Q6F7a.json', // New Coffee Success Animation
                height: 250,
                repeat: false,
                errorBuilder: (context, error, stackTrace) {
                  // Fallback if network fails
                  return Container(
                    height: 250,
                    alignment: Alignment.center,
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.check_circle,
                          color: AppColors.primary, size: 100),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              Text("Order Success!",
                  style: AppStyles.heading.copyWith(fontSize: 32)),
              const SizedBox(height: 15),
              Text(
                "Your coffee is being prepared by our barista.",
                textAlign: TextAlign.center,
                style: AppStyles.body.copyWith(fontSize: 16),
              ),
              const SizedBox(height: 50),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (c) => const OrderTrackingPage()),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  child: Text("Track My Order", style: AppStyles.subHeading),
                ),
              ),
              const SizedBox(height: 15),
              TextButton(
                onPressed: () =>
                    Navigator.popUntil(context, (route) => route.isFirst),
                child: Text("Back to Home",
                    style: TextStyle(color: AppColors.secondaryText)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
