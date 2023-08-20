import 'package:flutter/material.dart';
import 'package:mechanics_mangao/models/ShopProduct.dart';
import 'package:mechanics_mangao/screens/details/details_screen.dart';

import '../constants.dart';
import '../size_config.dart';

class ShopProductCard extends StatelessWidget {
  const ShopProductCard({
    Key? key,
    this.width = 158,
    this.aspectRatio = 1.5,
    required this.product,
  }) : super(key: key);

  final double width, aspectRatio;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(
          context,
          DetailsScreen.routeName,
          arguments: ProductDetailsArguments(product: product),
        ),
        child: Container(
          padding: EdgeInsets.only(left: 0, right: 0, top: 15),
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: kSecondaryColor.withOpacity(0.2),
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: aspectRatio,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                  child: Hero(
                    tag: product.id.toString(),
                    child: Image.asset(
                      product.images[0],
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenWidth(10)),
              Padding(
                padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: getProportionateScreenWidth(14),
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: getProportionateScreenWidth(0)),
                    Text(
                      "\Rs ${product.price}",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(16),
                        fontWeight: FontWeight.w600,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}