import 'package:flutter/material.dart';
import 'constants.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("Support & Feedback", style: AppStyles.subHeading),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("How can we help you?", style: AppStyles.subHeading.copyWith(fontSize: 20)),
            const SizedBox(height: 20),
            _buildContactCard("Live Chat", "Our team is online 24/7", Icons.chat),
            _buildContactCard("Email Support", "Response within 24 hours", Icons.email),
            _buildContactCard("Call Us", "Mon-Fri, 9AM-5PM", Icons.phone),
            const SizedBox(height: 40),
            Text("Frequently Asked Questions", style: AppStyles.subHeading.copyWith(fontSize: 20)),
            const SizedBox(height: 20),
            _buildFAQ("How do I track my order?", "You can track your order in the 'My Orders' section of your profile."),
            _buildFAQ("What payment methods are accepted?", "We accept Credit Cards, Google Pay, and Apple Pay."),
            _buildFAQ("Can I cancel my order?", "Orders can be canceled within 2 minutes of placement."),
          ],
        ),
      ),
    );
  }

  Widget _buildContactCard(String title, String subtitle, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 30),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppStyles.subHeading.copyWith(fontSize: 16)),
                Text(subtitle, style: AppStyles.body),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.secondaryText),
        ],
      ),
    );
  }

  Widget _buildFAQ(String question, String answer) {
    return ExpansionTile(
      title: Text(question, style: AppStyles.subHeading.copyWith(fontSize: 14)),
      iconColor: AppColors.primary,
      collapsedIconColor: AppColors.white,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(answer, style: AppStyles.body),
        ),
      ],
    );
  }
}
