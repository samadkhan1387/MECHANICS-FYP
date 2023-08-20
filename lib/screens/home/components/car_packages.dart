import 'package:flutter/material.dart';
import 'package:mechanics_mangao/components/shop_product_card.dart';
import 'package:mechanics_mangao/models/ShopProduct.dart';

import '../../../size_config.dart';
import 'section_title2.dart';

class CarPackages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: " Car Service Packages", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 0.94,
          physics: NeverScrollableScrollPhysics(), // Disable scrolling in the grid
          children: List.generate(
            demoProducts.length,
                (index) {
              if (demoProducts[index].isPopular)
                return ShopProductCard(product: demoProducts[index]);
              return SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}