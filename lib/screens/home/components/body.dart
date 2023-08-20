import 'package:flutter/material.dart';

import '../../../size_config.dart';

import 'car_packages.dart';
import 'welcome_banner.dart';
import 'home_header.dart';

import 'Special_Offers.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(0)),
            WelcomeBanner(),
            SizedBox(height: getProportionateScreenWidth(0)),
            SpecialOffers(),
            SizedBox(height: getProportionateScreenHeight(12)),
            CarPackages(),
            SizedBox(height: getProportionateScreenWidth(20)),
          ],
        ),
      ),
    );
  }
}
