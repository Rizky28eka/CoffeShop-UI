import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:provider/provider.dart';
import 'providers/coffee_shop_provider.dart';
import 'coffee_details_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String searchQuery = "";

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
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: AppColors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      onChanged: (value) {
                        setState(() {
                          searchQuery = value;
                        });
                      },
                      style: const TextStyle(color: AppColors.white),
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
                  ),
                ],
              ),
              const SizedBox(height: 30),
              if (searchQuery.isEmpty) ...[
                Text("Recent Searches", style: AppStyles.subHeading.copyWith(fontSize: 18)),
                const SizedBox(height: 15),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: ["Cappuccino", "Latte", "Macchiato", "Espresso"].map((tag) {
                    return GestureDetector(
                      onTap: () => setState(() => searchQuery = tag),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppColors.cardBackground,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(tag, style: AppStyles.body.copyWith(color: AppColors.white)),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 40),
                Text("Recommendations", style: AppStyles.subHeading.copyWith(fontSize: 18)),
              ] else
                Text("Search Results", style: AppStyles.subHeading.copyWith(fontSize: 18)),
              const SizedBox(height: 15),
              Expanded(
                child: Consumer<CoffeeShopProvider>(
                  builder: (context, value, child) {
                    final results = value.shop.where((coffee) => coffee.name.toLowerCase().contains(searchQuery.toLowerCase())).toList();
                    
                    if (results.isEmpty) {
                      return Center(child: Text("No coffee found", style: AppStyles.body));
                    }

                    return ListView.builder(
                      itemCount: results.length,
                      itemBuilder: (context, index) {
                        final coffee = results[index];
                        return ListTile(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => CoffeeDetailsPage(coffee: coffee))),
                          contentPadding: EdgeInsets.zero,
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(coffee.imagePath, width: 50, height: 50, fit: BoxFit.cover),
                          ),
                          title: Text(coffee.name, style: AppStyles.subHeading.copyWith(fontSize: 16)),
                          subtitle: Text("€ ${coffee.price}", style: AppStyles.body),
                          trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.secondaryText),
                        );
                      },
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
