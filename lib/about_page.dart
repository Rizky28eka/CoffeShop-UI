import 'package:flutter/material.dart';
import 'constants.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("About Us", style: AppStyles.subHeading),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            const Icon(Icons.coffee, color: AppColors.primary, size: 100),
            const SizedBox(height: 20),
            Text("Coffee Shop v1.0.0", style: AppStyles.subHeading.copyWith(fontSize: 18)),
            const SizedBox(height: 30),
            Text(
              "We are a premium coffee shop dedicated to providing the best coffee experience. Our beans are sourced from the finest plantations and roasted with precision to bring out the unique flavors of each origin.",
              textAlign: TextAlign.center,
              style: AppStyles.body.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 40),
            _buildInfoRow("Website", "www.coffeeshop.com"),
            _buildInfoRow("Email", "support@coffeeshop.com"),
            _buildInfoRow("Version", "1.0.0 (Build 2404)"),
            const SizedBox(height: 40),
            Text("Follow Us", style: AppStyles.subHeading.copyWith(fontSize: 18)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialIcon(Icons.facebook),
                _buildSocialIcon(Icons.camera_alt),
                _buildSocialIcon(Icons.alternate_email),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppStyles.body),
          Text(value, style: AppStyles.subHeading.copyWith(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: AppColors.primary),
    );
  }
}
