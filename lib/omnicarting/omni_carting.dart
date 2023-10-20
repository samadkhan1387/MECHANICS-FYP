import 'package:flutter/material.dart';
import 'package:mechanics_mangao/omnicarting/bookcart_tickets.dart';
import 'package:mechanics_mangao/omnicarting/register_cart.dart';


class OmniCarting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Omni Carting Booking', style: TextStyle(color: Colors.black)),
        backgroundColor: Color(0xFF3C8ED3),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Register Cart for Auto Show',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage('assets/images/carting1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 180,
                width: 360,
              ),
              SizedBox(height: 20),
              Center(
                child: SizedBox(
                  height: 60, // Increase the height of the button
                  width: 250, // Increase the width of the button
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the "register_car" page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterCart(), // Replace with the actual widget for your "register_car" page
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF3C8ED3), // Button background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // Add border radius to the button
                      ),
                    ),
                    child: Text(
                      'Register Cart',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Divider(color: Color(0xFF3C8ED3)),
              Text(
                'Book Ticket for Omni Carting',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage('assets/images/carting1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 180,
                width: 360,
              ),
              SizedBox(height: 20),
              Center(
                child: SizedBox(
                  height: 60, // Increase the height of the button
                  width: 250, // Increase the width of the button
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the "register_car" page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookCartTickets(), // Replace with the actual widget for your "register_car" page
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF3C8ED3), // Button background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // Add border radius to the button
                      ),
                    ),
                    child: Text(
                      'Book Ticket',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
