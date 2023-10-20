import 'package:flutter/material.dart';
import 'package:mechanics_mangao/providers/notification_screen.dart';

class RegisterCart extends StatefulWidget {
  @override
  _RegisterCartState createState() => _RegisterCartState();
}

class _RegisterCartState extends State<RegisterCart> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _cnicController = TextEditingController();
  TextEditingController _carModelController = TextEditingController();
  TextEditingController _carnoplateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart Registration Details",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFF3C8ED3),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(21),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                      return 'Name should only contain alphabets';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    if (!RegExp(r'^\d{11}$').hasMatch(value)) {
                      return 'Phone number must be 11 digits';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _cnicController,
                  decoration: InputDecoration(labelText: 'CNIC'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your CNIC';
                    }
                    if (!RegExp(r'^\d{13}$').hasMatch(value)) {
                      return 'CNIC must be 13 digits';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _carModelController,
                  decoration: InputDecoration(labelText: 'Cart Model'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter cart model';
                    }
                    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                      return 'Cart model only contain alphabets';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _carnoplateController,
                  decoration: InputDecoration(labelText: 'Cart No-Plate'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your cart no';
                    }
                    if (!RegExp(r'^[a-zA-Z]+-\d+$').hasMatch(value)) {
                      return 'Invalid cart no-plate format';
                    }
                    return null;
                  },
                ),
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
                            String carNoPlate = _carnoplateController.text;
                            // Add notification to the NotificationScreen
                            NotificationScreen.addNotification(
                              'Your cart with No-Plate $carNoPlate has been registered for Omni Carting.',
                            );

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Your cart has been registered for Omni Carting')),
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xFF3C8ED3),
                          ),
                        ),
                        child: Text('Confirm Registration', style: TextStyle(fontSize: 20)),
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
}
