import 'package:flutter/material.dart';
import 'package:mechanics_mangao/screens/cart/cart_screen.dart';
import '../../../constants.dart';
import '../../../models/Cart.dart';
import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
import 'package:mechanics_mangao/providers/notification_screen.dart';

class ShopHeader extends StatelessWidget {
  const ShopHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(19)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: SizeConfig.screenWidth * 0.6, // Adjust the width as needed
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
              onChanged: (String query) {
                // Handle search query here
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: getProportionateScreenWidth(10),
                ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: "Search product",
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Cart Icon.svg",
            numOfitem: (demoCarts.length),
            press: () => Navigator.pushNamed(context, CartScreen.routeName),
          ),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfitem: 0,
            press: () => Navigator.pushNamed(context, NotificationScreen.routeName),
          ),
        ],
      ),
    );
  }
}
