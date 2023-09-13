import 'package:flutter/material.dart';
import 'package:mechanics_mangao/components/default_button.dart';
import 'package:mechanics_mangao/models/Cart.dart';

import './checkout_screen.dart';
import '../../../size_config.dart';

class CheckoutCard extends StatelessWidget {
  final List<Cart> cartItems;

  const CheckoutCard({
    Key? key,
    required this.cartItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate the total price by iterating through the cartItems list
    double totalPrice = cartItems.fold(0, (sum, cart) => sum + (cart.product.price * cart.numOfItem));
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                 Text("Please Proceed to Checkout Now" ,style: TextStyle(fontSize: 16,color: Colors.black)),
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total:\n", style: TextStyle(fontSize: 20,color: Color(0xFF3C8ED3)),

                    children: [
                      TextSpan(
                        text: "\Rs $totalPrice", // Display the total price here
                        style: TextStyle(fontSize: 24, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(160),
                  child: Container(
                    width: double.infinity, // Makes the button take the full width
                    height: 60,
                    child: DefaultButton(
                      text: "Check Out",
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CheckoutScreen(cartItems: demoCarts),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
