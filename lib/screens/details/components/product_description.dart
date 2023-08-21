import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mechanics_mangao/models/ShopProduct.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({
    Key? key,
    required this.product,
    this.pressOnSeeMore,
  }) : super(key: key);

  final Product product;
  final GestureTapCallback? pressOnSeeMore;

  @override
  _ProductDescriptionState createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  bool showFullDescription = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.product.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(20),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "\Rs ${widget.product.price}",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(20),
                  fontWeight: FontWeight.w600,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),

        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(15)),
            width: getProportionateScreenWidth(64),
            decoration: BoxDecoration(
              color:
              widget.product.isFavourite ? Color(0xFF3C8ED3) : Color(0xFFF5F6F9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: SvgPicture.asset(
              "assets/icons/Heart Icon_2.svg",
              color:
              widget.product.isFavourite ? Color(0xFFFF4848) : Color(0xFFDBDEE4),
              height: getProportionateScreenWidth(16),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(64),
          ),
          child: Text(
            widget.product.description,
            maxLines: showFullDescription ? null : 3,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: 10,
          ),
          child: GestureDetector(
            onTap: () {
              setState(() {
                showFullDescription = !showFullDescription;
              });
            },
            child: Row(
              children: [
                Text(
                  showFullDescription ? "See Less Detail" : "See More Detail",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor,
                  ),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kPrimaryColor,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
