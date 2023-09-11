import 'package:flutter/material.dart';

class RegisterCar extends StatefulWidget {
  @override
  _RegisterCarState createState() => _RegisterCarState();
}

class _RegisterCarState extends State<RegisterCar> {
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
          "Add Car Registration Details",
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
                  decoration: InputDecoration(labelText: 'Car Model'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter car model';
                    }
                    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                      return 'Car model only contain alphabets';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _carnoplateController,
                  decoration: InputDecoration(labelText: 'Car No-Plate'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your car no';
                    }
                    if (!RegExp(r'^[a-zA-Z]+-\d+$').hasMatch(value)) {
                      return 'Invalid car no-plate format';
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
                            // Handle appointment booking logic here
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Your car has been registered')),
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFF3C8ED3)),
                        ),
                        child:
                        Text('Confirm Registration', style: TextStyle(fontSize: 20)),
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

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _cnicController.dispose();
    _carModelController.dispose();
    _carnoplateController.dispose();
    super.dispose();
  }
}
