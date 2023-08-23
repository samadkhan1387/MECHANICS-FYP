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
    images: ["assets/images/tuning1.png"],
    colors: [Color(0xFFF6625E), Color(0xFF836DB8), Color(0xFFDECB9C), Colors.white],
    title: "Tuning Service Package",
    price: 1500,
    description: "Throttle body cleaning"
        ", Spark plug cleaning"
        ", MAP,MAF, Oxygen sensor cleaning"
        ", OBD scanning & calibration"
        ", Fluid level inspection",
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
    category: "Car Service", // Added category
  ),
  Product(
    id: 2,
    images: ["assets/images/dailydriver.png"],
    colors: [Color(0xFFF6625E), Color(0xFF836DB8), Color(0xFFDECB9C), Colors.white],
    title: "Daily Driver Package",
    price: 3000,
    description: "Throttle body cleaning"
        ", Spark plug cleaning"
        ", MAP,MAF, Oxygen sensor cleaning"
        ", OBD scanning & calibration"
        ", Fluid level inspection"
        ",Leakage inspection",
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
    category: "Car Service", // Added category
  ),
  Product(
    id: 3,
    images: ["assets/images/brakes.png"],
    colors: [Color(0xFFF6625E), Color(0xFF836DB8), Color(0xFFDECB9C), Colors.white],
    title: "Brakes Overhaul Package",
    price: 3500,
    description: "Front and Rear calliper service"
        ",Drum brake service"
        ",Brake fluid top up"
        ",Disc and Drum lathe turning"
        ",Brake pad replacement"
        ",Brake shoe replacement",
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
    category: "Car Service", // Added category
  ),
  Product(
    id: 4,
    images: ["assets/images/steering.png"],
    colors: [Color(0xFFF6625E), Color(0xFF836DB8), Color(0xFFDECB9C), Colors.white],
    title: "Honda Steering Wheel",
    price: 10000,
    description: "original honda steering wheel for your car",
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
    category: "spare part", // Added category
  ),
  Product(
    id: 5,
    images: ["assets/images/sparkplug.png"],
    colors: [Color(0xFFF6625E), Color(0xFF836DB8), Color(0xFFDECB9C), Colors.white],
    title: "Spark Plug",
    price: 700,
    description: "Engine iridium sparkplug orignial NGK",
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
    category: "spare part", // Added category
  ),
  Product(
    id: 6,
    images: ["assets/images/mobiloil.png"],
    colors: [Color(0xFFF6625E), Color(0xFF836DB8), Color(0xFFDECB9C), Colors.white],
    title: "Mobile 1 Oil",
    price: 700,
    description: "Mobil 1™ motor oils are advanced full synthetic motor oils designed to keep your engine running like new by providing exceptional wear protection, cleaning power and overall performance",
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
    category: "spare part", // Added category
  ),
];
