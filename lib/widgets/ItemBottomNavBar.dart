import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/cart_helper.dart';
import 'package:flutter_application_1/model/cart.dart';

class ItemBottomNavBar extends StatelessWidget {
  final DatabaseHelper _databaseService = DatabaseHelper();
  int id;
  int quantity;
  ItemBottomNavBar({required this.id, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        child: Container(
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 10,
              offset: Offset(0, 3),
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "\$120",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4C53A5),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () async {
              Cart? cart = await _databaseService.cart(id);
              if (cart == null) {
                await _databaseService
                    .insertCart(Cart(id_product: id, quantity: 0));
                await _databaseService
                    .updateCart(Cart(id_product: id, quantity: quantity));
              } else {
                cart.increaseQuanNum(quantity);
                await _databaseService.updateCart(cart);
              }
            },
            icon: Icon(Icons.shopping_cart),
            label: Text(
              "Add To Cart",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                //color: Colors.white,
              ),
            ),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Color.fromARGB(255, 255, 255, 255)),
              padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: 13, horizontal: 15),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
          ),
        ],
      ),
    ));
  }
}
