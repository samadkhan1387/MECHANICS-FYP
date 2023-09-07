import 'package:flutter/material.dart';

class EngineTuningDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          // Image at the top
          Container(
            height: 200, // Adjust the height as needed
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'your_image_path_here'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 20),

          // Product Title
          Text(
            'Product Title',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),

          // Product Price
          Text(
            'Rs:99.99', // Replace with the actual price
            style: TextStyle(
              fontSize: 18,
              color: Colors.black, // Customize the color
            ),
          ),
          SizedBox(height: 10),

          // Product Description
          Text(
            'Product Description goes here. Replace this with the actual product description.',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 20),

          // Button
          ElevatedButton(
            onPressed: () {
              // Add your button action here
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15),
              primary: Colors.blue, // Customize the button color
            ),
            child: Text(
              'Add to Cart',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
