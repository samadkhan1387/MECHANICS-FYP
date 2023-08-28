import 'package:flutter/material.dart';
import 'package:mechanics_mangao/components/shop_product_card.dart';
import 'package:mechanics_mangao/models/ShopProduct.dart';

import '../../../size_config.dart';
import 'section_title2.dart';

class CarPackages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Filter the list to include only products with category "Car Service"
    List<Product> carServicePackages = demoProducts.where((product) {
      return product.category == "Car Service";
    }).toList();

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(21)),
          child: SectionTitle(title: "Car Service Packages", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(10)),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 0.78,
          physics: NeverScrollableScrollPhysics(),
          mainAxisSpacing: 1, // Adjust this value to decrease vertical spacing
          crossAxisSpacing: 0, // Adjust this value to decrease horizontal spacing// Disable scrolling in the grid
          children: List.generate(
            carServicePackages.length,
                (index) {
              return ShopProductCard(product: carServicePackages[index]);
            },
          ),
        ),
      ],
    );
  }
}
