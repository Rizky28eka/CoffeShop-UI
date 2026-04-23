import 'package:flutter/material.dart';
import 'constants.dart';
import 'models/coffee.dart';
import 'providers/coffee_shop_provider.dart';
import 'package:provider/provider.dart';

class CoffeeDetailsPage extends StatefulWidget {
  final Coffee coffee;

  const CoffeeDetailsPage({
    super.key,
    required this.coffee,
  });

  @override
  State<CoffeeDetailsPage> createState() => _CoffeeDetailsPageState();
}

class _CoffeeDetailsPageState extends State<CoffeeDetailsPage> {
  String selectedSize = "M";

  void addToCart() {
    context.read<CoffeeShopProvider>().addToCart(widget.coffee, size: selectedSize);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Added to cart!"),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400,
            pinned: true,
            backgroundColor: AppColors.background,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: widget.coffee.imagePath,
                child: Image.asset(
                  widget.coffee.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: AppColors.white),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.favorite_border, color: AppColors.white),
                onPressed: () {},
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.coffee.name, style: AppStyles.subHeading.copyWith(fontSize: 28)),
                          Text(widget.coffee.type, style: AppStyles.body),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 20),
                          const SizedBox(width: 5),
                          Text(widget.coffee.rating.toString(), style: AppStyles.subHeading.copyWith(fontSize: 16)),
                          Text(" (2k reviews)", style: AppStyles.body),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Text("Description", style: AppStyles.subHeading.copyWith(fontSize: 18)),
                  const SizedBox(height: 10),
                  Text(
                    widget.coffee.description,
                    style: AppStyles.body,
                  ),
                  const SizedBox(height: 25),
                  Text("Size", style: AppStyles.subHeading.copyWith(fontSize: 18)),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: ["S", "M", "L"].map((size) {
                      bool isSelected = size == selectedSize;
                      return GestureDetector(
                        onTap: () => setState(() => selectedSize = size),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                          decoration: BoxDecoration(
                            color: isSelected ? AppColors.primary.withValues(alpha: 0.1) : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: isSelected ? AppColors.primary : AppColors.cardBackground,
                            ),
                          ),
                          child: Text(
                            size,
                            style: TextStyle(
                              color: isSelected ? AppColors.primary : AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 100), // Spacer for bottom bar
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Price", style: AppStyles.body),
                Text("€ ${widget.coffee.price}", style: AppStyles.price.copyWith(fontSize: 24, color: AppColors.white)),
              ],
            ),
            ElevatedButton(
              onPressed: addToCart,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                "Buy Now",
                style: AppStyles.subHeading.copyWith(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
