import 'package:flutter/material.dart';
import 'constants.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("Settings", style: AppStyles.subHeading),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildSectionHeader("Account"),
          _buildSettingsTile("Change Password", Icons.lock),
          _buildSettingsTile("Language", Icons.language, trailing: "English"),
          const SizedBox(height: 20),
          _buildSectionHeader("Notifications"),
          _buildSwitchTile("Push Notifications", true),
          _buildSwitchTile("Email Notifications", false),
          const SizedBox(height: 20),
          _buildSectionHeader("Others"),
          _buildSettingsTile("Privacy Policy", Icons.privacy_tip),
          _buildSettingsTile("Terms of Service", Icons.description),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(title, style: AppStyles.subHeading.copyWith(fontSize: 18, color: AppColors.primary)),
    );
  }

  Widget _buildSettingsTile(String title, IconData icon, {String? trailing}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: AppColors.white),
      title: Text(title, style: AppStyles.body.copyWith(color: AppColors.white)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailing != null) Text(trailing, style: AppStyles.body),
          const SizedBox(width: 5),
          const Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.secondaryText),
        ],
      ),
    );
  }

  Widget _buildSwitchTile(String title, bool value) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: AppStyles.body.copyWith(color: AppColors.white)),
      trailing: Switch(
        value: value,
        onChanged: (v) {},
        activeThumbColor: AppColors.primary,
      ),
    );
  }
}
