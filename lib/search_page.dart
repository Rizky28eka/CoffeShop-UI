import 'package:flutter/material.dart';
import 'constants.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: AppColors.primary),
                  hintText: "Search for coffee...",
                  hintStyle: AppStyles.body,
                  filled: true,
                  fillColor: AppColors.cardBackground,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text("Recent Searches", style: AppStyles.subHeading.copyWith(fontSize: 18)),
              const SizedBox(height: 15),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: ["Cappuccino", "Latte", "Macchiato", "Espresso"].map((tag) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.cardBackground,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(tag, style: AppStyles.body.copyWith(color: AppColors.white)),
                  );
                }).toList(),
              ),
              const SizedBox(height: 40),
              Text("Recommendations", style: AppStyles.subHeading.copyWith(fontSize: 18)),
              const SizedBox(height: 15),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset("assets/images/1.jpg", width: 50, height: 50, fit: BoxFit.cover),
                      ),
                      title: Text("Creamy Latte", style: AppStyles.subHeading.copyWith(fontSize: 16)),
                      subtitle: Text("€ 3.50", style: AppStyles.body),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.secondaryText),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
