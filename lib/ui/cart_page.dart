import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerapp/provider/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<CartProvider>(
      builder: (context, value, child) => SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 35,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: value.cartItem.length,
                padding: const EdgeInsets.all(12),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                    ),
                    child: ListTile(
                      leading: Image.asset(value.cartItem[index][2]),
                      title: Text(value.cartItem[index][0]),
                      subtitle: Text("\$ ${value.cartItem[index][1]}"),
                      trailing: IconButton(
                        onPressed: () {
                          Provider.of<CartProvider>(context, listen: false)
                              .removeFromCart(index);
                        },
                        icon: const Icon(Icons.cancel),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.green,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Text("Total Price"),
                        Text(value.calculatePrice().toString())
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: const [
                          Text('Pay Now'),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
