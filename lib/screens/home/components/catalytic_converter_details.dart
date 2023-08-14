import 'package:flutter/material.dart';

class CatalyticConverterDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalytic Converter Cleaning Details'),
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
                'Catalytic Converter Cleaning',
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
              title: 'Basic Catalytic Converter Cleaning',
              description: 'Removes carbon buildup and improves performance.',
              price: '\$49',
            ),
            PackageCard(
              title: 'Advanced Catalytic Converter Cleaning',
              description: 'Includes carbon buildup removal and diagnostic check.',
              price: '\$99',
            ),
            // Add more PackageCard widgets for additional catalytic converter cleaning packages
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
