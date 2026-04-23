import 'package:flutter/material.dart';
import 'constants.dart';

class StoreLocatorPage extends StatelessWidget {
  const StoreLocatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("Store Locator", style: AppStyles.subHeading),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            color: AppColors.cardBackground,
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.map, color: AppColors.primary, size: 50),
                  Text("Map View Placeholder", style: TextStyle(color: AppColors.secondaryText)),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.location_on, color: AppColors.primary, size: 30),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Coffee Shop Branch #$index", style: AppStyles.subHeading.copyWith(fontSize: 16)),
                            Text("0.5 km away • Open until 10 PM", style: AppStyles.body),
                          ],
                        ),
                      ),
                      const Icon(Icons.directions, color: AppColors.primary),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
