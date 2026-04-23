import 'package:flutter/material.dart';
import 'constants.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("Edit Profile", style: AppStyles.subHeading),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("SAVE", style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Stack(
              children: [
                const CircleAvatar(radius: 60, backgroundImage: AssetImage("assets/images/1.jpg")),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                    child: const Icon(Icons.camera_alt, color: AppColors.white, size: 20),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            _buildEditField("Full Name", "John Doe"),
            const SizedBox(height: 20),
            _buildEditField("Email", "john.doe@example.com"),
            const SizedBox(height: 20),
            _buildEditField("Phone Number", "+1 234 567 890"),
            const SizedBox(height: 20),
            _buildEditField("Address", "123 Coffee Street, Espresso City"),
          ],
        ),
      ),
    );
  }

  Widget _buildEditField(String label, String initialValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppStyles.body),
        const SizedBox(height: 8),
        TextField(
          controller: TextEditingController(text: initialValue),
          style: const TextStyle(color: AppColors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.cardBackground,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
          ),
        ),
      ],
    );
  }
}
