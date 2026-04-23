import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'coffee_tile.dart';
import 'coffee_type_tab.dart';
import 'coffee_details_page.dart';
import 'cart_page.dart';
import 'favorites_page.dart';
import 'profile_page.dart';
import 'search_page.dart';
import 'notifications_page.dart';
import 'constants.dart';
import 'providers/coffee_shop_provider.dart';
import 'models/coffee.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List coffeeTypes = [
    ["Cappuccino", true],
    ["Black", false],
    ["Latte", false],
    ["Tea", false]
  ];

  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeTypes.length; i++) {
        coffeeTypes[i][1] = (i == index);
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return _buildHome();
      case 1:
        return const CartPage();
      case 2:
        return const FavoritesPage();
      case 3:
        return const ProfilePage();
      default:
        return _buildHome();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.background,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.secondaryText,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Fav"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildHome() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: const Icon(Icons.menu),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const NotificationsPage())),
            ),
            const Padding(padding: EdgeInsets.only(right: 15)),
          ],
        ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              " Find the best \n coffee for your ",
              style: GoogleFonts.bebasNeue(
                fontSize: 45,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextField(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const SearchPage())),
              readOnly: true,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: AppColors.primary),
                  hintText: "Find your coffee ...",
                  filled: true,
                  fillColor: AppColors.cardBackground,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none)),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              itemCount: coffeeTypes.length,
              itemBuilder: (context, index) => CoffeeTypeTab(
                  coffeeType: coffeeTypes[index][0],
                  isSelected: coffeeTypes[index][1],
                  onTap: () => coffeeTypeSelected(index)),
              scrollDirection: Axis.horizontal,
            ),
          ),
          Expanded(
            child: Consumer<CoffeeShopProvider>(
              builder: (context, value, child) => ListView.builder(
                itemCount: value.shop.length,
                itemBuilder: (context, index) {
                  Coffee coffee = value.shop[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (c) => CoffeeDetailsPage(
                          coffee: coffee,
                        ),
                      ),
                    ),
                    child: CoffeeTile(
                        imagePath: coffee.imagePath,
                        type: coffee.name,
                        price: coffee.price),
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      );
    }
}
