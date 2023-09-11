import 'package:flutter/material.dart';
import 'package:mechanics_mangao/models/Cart.dart';
import 'package:lottie/lottie.dart';

import 'CardPaymentScreen.dart';

class CheckoutScreen extends StatefulWidget {
  final List<Cart> cartItems;

  CheckoutScreen({required this.cartItems});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String paymentMethod = "Cash on Delivery";
  String fullName = "";
  String address = "";
  String city = "";
  String province = "";
  String zipCode = "";
  bool cardPaymentSelected = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Shipping Address", style: TextStyle(color: Colors.black)),
        backgroundColor: Color(0xFF3C8ED3),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  onChanged: (newValue) {
                    setState(() {
                      fullName = newValue;
                    });
                  },
                  decoration: InputDecoration(labelText: "Full Name", hintText: "Enter your name"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  onChanged: (newValue) {
                    setState(() {
                      address = newValue;
                    });
                  },
                  decoration: InputDecoration(labelText: "Address", hintText: "Enter your full address"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  onChanged: (newValue) {
                    setState(() {
                      city = newValue;
                    });
                  },
                  decoration: InputDecoration(labelText: "City", hintText: "Enter your city"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your city';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  onChanged: (newValue) {
                    setState(() {
                      province = newValue;
                    });
                  },
                  decoration: InputDecoration(labelText: "Province", hintText: "Enter your province"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your province';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  onChanged: (newValue) {
                    setState(() {
                      zipCode = newValue;
                    });
                  },
                  decoration: InputDecoration(labelText: "Zip Code", hintText: "Enter your Zip Code "),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Zip Code';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text(
                  "Select Payment Method",
                  style: TextStyle(fontSize: 22, color: Colors.black),
                ),
                buildPaymentMethodOptions(),
                if (cardPaymentSelected) ...[
                  // Include additional fields for card payment if needed
                ],
                SizedBox(height: 20),
                Center(
                  child: Container(
                    width: 250,
                    height: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Validate the payment method
                            if (paymentMethod == "Cash on Delivery") {
                              // Handle Cash on Delivery payment
                              _placeOrder();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Your order has been booked')));
                            } 
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF3C8ED3)),
                        ),
                        child: Text("Place Order", style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _placeOrder() {
    // Perform order processing or API calls here.

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderSuccessScreen(),
      ),
    );
  }

  Widget buildPaymentMethodOptions() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Radio(
              value: "Cash on Delivery",
              groupValue: paymentMethod,
              onChanged: (value) {
                setState(() {
                  paymentMethod = value.toString();
                  cardPaymentSelected = false;
                });
              },
            ),
            Expanded(
              child: ListTile(
                title: Text("Cash on Delivery"),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Radio(
              value: "Card Payment",
              groupValue: paymentMethod,
              onChanged: (value) {
                setState(() {
                  paymentMethod = value.toString();
                  cardPaymentSelected = true;
                });

                if (cardPaymentSelected) {
                  // Navigate to CardPaymentScreen when Card Payment is selected
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CardPaymentScreen(),
                    ),
                  );
                }
              },
            ),
            Expanded(
              child: ListTile(
                title: Text("Card Payment"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class OrderSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Placed"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/animations/order_success_animation.json',
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              "Order Placed Successfully!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/home',
                      (route) => false,
                );
              },
              child: Text(
                "Continue Shopping",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
