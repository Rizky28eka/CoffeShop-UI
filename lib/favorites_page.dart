import 'package:flutter/material.dart';
import 'constants.dart';
import 'coffee_tile.dart';
import 'package:provider/provider.dart';
import 'providers/coffee_shop_provider.dart';
import 'models/coffee.dart';
import 'coffee_details_page.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("Favorites", style: AppStyles.subHeading),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Consumer<CoffeeShopProvider>(
        builder: (context, value, child) => value.favorites.isEmpty
            ? Center(
                child: Text("No favorites yet", style: AppStyles.body),
              )
            : GridView.builder(
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: value.favorites.length,
                itemBuilder: (context, index) {
                  Coffee coffee = value.favorites[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (c) => CoffeeDetailsPage(coffee: coffee),
                      ),
                    ),
                    child: CoffeeTile(
                      imagePath: coffee.imagePath,
                      type: coffee.name,
                      price: coffee.price,
                    ),
                  );
                },
              ),
      ),
    );
  }
}
