import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:provider/provider.dart';
import 'providers/coffee_shop_provider.dart';

class RewardsPage extends StatelessWidget {
  const RewardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("Rewards", style: AppStyles.subHeading),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Consumer<CoffeeShopProvider>(
        builder: (context, value, child) {
          double pointsToNextTier = 3000 - value.userPoints;
          double progress = value.userPoints / 3000;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppColors.primary, Color(0xFF8B4513)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Text("Total Points", style: AppStyles.body.copyWith(color: AppColors.white.withValues(alpha: 0.8))),
                      const SizedBox(height: 10),
                      Text(value.userPoints.toInt().toString(), style: AppStyles.heading.copyWith(fontSize: 50)),
                      const SizedBox(height: 20),
                      Container(
                        height: 10,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: progress.clamp(0.0, 1.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text("${pointsToNextTier.toInt()} points more to reach Gold Member", style: AppStyles.body.copyWith(color: AppColors.white, fontSize: 12)),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                _buildVoucherTile("Free Espresso", "Expired in 2 days", "REDEEM"),
                _buildVoucherTile("20% Discount", "Expired in 5 days", "REDEEM"),
                _buildVoucherTile("Buy 1 Get 1", "Special for you", "REDEEM"),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildVoucherTile(String title, String subtitle, String btnText) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const Icon(Icons.confirmation_num, color: AppColors.primary, size: 40),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppStyles.subHeading.copyWith(fontSize: 16)),
                Text(subtitle, style: AppStyles.body),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(btnText, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
