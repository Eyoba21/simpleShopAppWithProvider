import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GroceryItemTile extends StatelessWidget {
  String itemName;
  double itemPrice;
  String imagePath;
  Color color;
  Color buttonColor;
  void Function()? onPressed;
  GroceryItemTile(
      {super.key,
      required this.itemName,
      required this.itemPrice,
      required this.imagePath,
      required this.color,
      required this.onPressed,
      required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //image
        Container(
          margin: EdgeInsets.zero,
          height: 200,
          width: 150,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Image.asset(
                imagePath,
                height: 64,
              ),
              const SizedBox(height: 10),
              Text(itemName),
              const SizedBox(height: 5),
              Text(" \$ ${itemPrice.toString()}"),
              const SizedBox(height: 10),
              MaterialButton(
                onPressed: onPressed,
                color: buttonColor,
                child: const Text(
                  "Order",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
