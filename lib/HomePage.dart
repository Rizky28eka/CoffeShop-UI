import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'CoffeTile.dart';
import 'coffetype.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List coffeType = [
    ["Cappuccino", true],
    ["Black", false],
    ["Latte", false],
    ["Tea", false]
  ];
  final List coffetile = [
    ["Cappuccino", "assets/images/1.jpg", "4.20"],
    ["Black", "assets/images/2.jpg", "2.30"],
    ["Latte", "assets/images/3.jpg", "5.10"],
  ];
  void CoffeeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeType.length; i++) {
        coffeType[i][1] = (i == index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        actions: const [
          Icon(Icons.person),
          Padding(padding: EdgeInsets.only(right: 15)),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              color: Color(0xFFcb7c4c),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "",
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              " Find the best \n coffe for your ",
              style: GoogleFonts.bebasNeue(
                fontSize: 45,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Find your coffe ...",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              itemCount: coffeType.length,
              itemBuilder: (context, index) => coffee_type(
                  coffetype: coffeType[index][0],
                  isselected: coffeType[index][1],
                  ontap: () => CoffeeSelected(index)),
              scrollDirection: Axis.horizontal,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: coffetile.length,
              itemBuilder: (context, index) => CoffeTile(
                  imagepath: coffetile[index][1],
                  type: coffetile[index][0],
                  price: coffetile[index][2]),
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }
}
