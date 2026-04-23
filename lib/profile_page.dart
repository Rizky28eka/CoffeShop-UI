import 'package:flutter/material.dart';
import 'constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("Profile", style: AppStyles.subHeading),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage("assets/images/1.jpg"), // Placeholder
            ),
            const SizedBox(height: 15),
            Text("John Doe", style: AppStyles.subHeading.copyWith(fontSize: 24)),
            Text("john.doe@example.com", style: AppStyles.body),
            const SizedBox(height: 30),
            _buildProfileItem(Icons.person, "Edit Profile"),
            _buildProfileItem(Icons.shopping_bag, "My Orders"),
            _buildProfileItem(Icons.favorite, "Favorites"),
            _buildProfileItem(Icons.card_membership, "Rewards"),
            _buildProfileItem(Icons.settings, "Settings"),
            _buildProfileItem(Icons.logout, "Logout", isLast: true),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String title, {bool isLast = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary),
          const SizedBox(width: 20),
          Text(title, style: AppStyles.subHeading.copyWith(fontSize: 16)),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, color: AppColors.secondaryText, size: 16),
        ],
      ),
    );
  }
}
