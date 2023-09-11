import 'package:flutter/material.dart';

import 'TicketCardPaymentScreen.dart';

class BookTickets extends StatefulWidget {
  @override
  _BookTicketsState createState() => _BookTicketsState();
}

class _BookTicketsState extends State<BookTickets> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _cnicController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Auto Show Ticket Booking",
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
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('assets/images/ticket.PNG'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 160,
                  width: 360,
                ),
                Text(
                  'Ticket Price: 800 Rs',
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xFF3C8ED3),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Single Person Ticket',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                Center(
                  child: Container(
                    width: 250,
                    height: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Navigate to the payment confirmation screen
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => TicketCardPaymentScreen(),
                              ),
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFF3C8ED3)),
                        ),
                        child: Text('Pay Now', style: TextStyle(fontSize: 20)),
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
    super.dispose();
  }
}