import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description, category; // Added category field
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
    required this.category, // Added category field
  });
}


// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: ["assets/images/mobiloil.png"],
    colors: [Color(0xFFF6625E), Color(0xFF836DB8), Color(0xFFDECB9C), Colors.white],
    title: "Tuning Service Package",
    price: 6000,
    description: "Mobil 1™ motor oils are advanced full synthetic motor oils designed to keep your engine running like new ... by providing exceptional wear protection, cleaning power and overall performance…",
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
    category: "Car Service", // Added category
  ),
  Product(
    id: 2,
    images: ["assets/images/steering.png"],
    colors: [Color(0xFFF6625E), Color(0xFF836DB8), Color(0xFFDECB9C), Colors.white],
    title: "Steering Wheel",
    price: 6000,
    description: "Mobil 1™ motor oils are advanced full synthetic motor oils designed to keep your engine running like new ... by providing exceptional wear protection, cleaning power and overall performance…",
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
    category: "spare part", // Added category
  ),
  Product(
    id: 3,
    images: ["assets/images/mobiloil.png"],
    colors: [Color(0xFFF6625E), Color(0xFF836DB8), Color(0xFFDECB9C), Colors.white],
    title: "Tuning Service Package",
    price: 6000,
    description: "Mobil 1™ motor oils are advanced full synthetic motor oils designed to keep your engine running like new ... by providing exceptional wear protection, cleaning power and overall performance…",
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
    category: "Car Service", // Added category
  ),
  Product(
    id: 4,
    images: ["assets/images/mobiloil.png"],
    colors: [Color(0xFFF6625E), Color(0xFF836DB8), Color(0xFFDECB9C), Colors.white],
    title: "Tuning Service Package",
    price: 6000,
    description: "Mobil 1™ motor oils are advanced full synthetic motor oils designed to keep your engine running like new ... by providing exceptional wear protection, cleaning power and overall performance…",
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
    category: "Car Service", // Added category
  ),
  Product(
    id: 5,
    images: ["assets/images/mobiloil.png"],
    colors: [Color(0xFFF6625E), Color(0xFF836DB8), Color(0xFFDECB9C), Colors.white],
    title: "Tuning Service Package",
    price: 6000,
    description: "Mobil 1™ motor oils are advanced full synthetic motor oils designed to keep your engine running like new ... by providing exceptional wear protection, cleaning power and overall performance…",
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
    category: "Car Service", // Added category
  ),
];
