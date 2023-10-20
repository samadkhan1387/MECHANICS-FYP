import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../autoshow/auto_show.dart';
import '../../../carmela/car_mela.dart';
import '../../../omnicarting/omni_carting.dart';
import '../../../size_config.dart';


class SpecialOffers extends StatefulWidget {
  const SpecialOffers({
    Key? key,
  }) : super(key: key);

  @override
  _SpecialOffersState createState() => _SpecialOffersState();
}

class _SpecialOffersState extends State<SpecialOffers> {
  int _currentSlide = 0; // Track the current carousel index

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: getProportionateScreenWidth(158),
            viewportFraction: 0.95,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            autoPlayAnimationDuration: Duration(milliseconds: 600),
            autoPlayCurve: Curves.easeInOut,
            onPageChanged: (index, reason) {
              setState(() {
                _currentSlide = index; // Update the current index
              });
            },
          ),
          items: [
            "assets/images/auto show 1.jpg",
            "assets/images/carmela.jpg",
            "assets/images/carting.jpg",
          ].map((image) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () {
                      if (_currentSlide == 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AutoShow(),
                          ),
                        );
                      } else if (_currentSlide == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CarMela(),
                          ),
                        );
                      } else if (_currentSlide == 2) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OmniCarting(),
                          ),
                        );
                      }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Stack(
                        children: [
                          Image.asset(
                            image,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xFF343434).withOpacity(0.4),
                                  Color(0xFF343434).withOpacity(0.15),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 12), // Add spacing between carousel and dots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 3; i++) // Change the count based on the number of items
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 4),
                width: i == _currentSlide ? 20 : 10, // Change dot size based on current index
                height: 10,
                decoration: BoxDecoration(
                  color: i == _currentSlide ? Colors.blue : Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
