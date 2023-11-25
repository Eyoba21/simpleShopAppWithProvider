import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import "package:providerapp/ui/grocery_item.dart";
import 'package:providerapp/provider/cart_provider.dart';
import "package:providerapp/ui/cart_page.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const CartPage(),
            ),
          );
        },
        child: const Icon(
          Icons.shopping_bag,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Good Morning",
                style: TextStyle(fontSize: 20, color: Colors.grey[600]),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Lets Order Fresh Item For You",
                style: GoogleFonts.notoSerif(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Divider(),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Fresh Items",
                style: TextStyle(fontSize: 20, color: Colors.grey[600]),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
                child: Consumer<CartProvider>(
              builder: (context, value, child) => GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1 / 1.2),
                itemCount: value.shopItem.length,
                itemBuilder: (context, index) => GroceryItemTile(
                  itemName: value.shopItem[index][0],
                  itemPrice: value.shopItem[index][1],
                  imagePath: value.shopItem[index][2],
                  color: value.shopItem[index][3],
                  buttonColor: value.shopItem[index][4],
                  onPressed: () {
                    Provider.of<CartProvider>(context, listen: false)
                        .addToCart(index);
                    if (value.cartItem != null) {
                      print("Success");
                    } else {
                      print('fail');
                    }
                  },
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
