import 'package:flutter/material.dart';

class EngineTuningDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Engine Tuning Details'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blue, // Set the background color to blue
        ),
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                'Engine Tuning',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            PackageCard(
              title: 'Basic Engine Tuning',
              description: 'Includes spark plug replacement and ignition timing adjustment.',
              price: '\$79',
            ),
            PackageCard(
              title: 'Performance Engine Tuning',
              description: 'Includes spark plug replacement, ignition timing adjustment, and fuel system optimization.',
              price: '\$129',
            ),
            // Add more PackageCard widgets for additional engine tuning packages
          ],
        ),
      ),
    );
  }
}


class PackageCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;

  const PackageCard({
    Key? key,
    required this.title,
    required this.description,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white, // Set the box color to white
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(description),
        ),
        trailing: Text(
          price,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
