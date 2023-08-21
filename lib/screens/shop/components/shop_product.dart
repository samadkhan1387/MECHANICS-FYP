import 'package:flutter/material.dart';
import 'package:mechanics_mangao/components/shop_product_card.dart';
import 'package:mechanics_mangao/models/ShopProduct.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class ShopProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Filter the list to include only spare parts products
    List<Product> spareParts = demoProducts.where((product) {
      return product.category == "spare part"; // Replace with the actual category of spare parts
    }).toList();

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Shop Spare Parts", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 0.88,
          physics: NeverScrollableScrollPhysics(), // Disable scrolling in the grid
          children: List.generate(
            spareParts.length,
                (index) {
              return ShopProductCard(product: spareParts[index]);
            },
          ),
        ),
      ],
    );
  }
}
