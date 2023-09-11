import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/ShopProduct.dart';
import '../../../size_config.dart';
import '../../details/details_screen.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  List<Product> searchResults = []; // List to store the search results
  bool isProductSelected = false; // Flag to track if a product is selected

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.6,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          TextField(
            onTap: () {
              setState(() {
                isProductSelected = false;
                searchResults.clear();
              });
            },
            onChanged: (value) {
              // Filter the products based on the search query
              setState(() {
                searchResults = demoProducts
                    .where((product) =>
                    product.title.toLowerCase().contains(value.toLowerCase()))
                    .toList();
              });
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(9),
              ),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: "Search product",
              prefixIcon: Icon(Icons.search),
            ),
          ),
          if (searchResults.isNotEmpty && !isProductSelected)
            Container(
              height: 50.0, // Adjust the height as needed
              child: SingleChildScrollView(
                child: Column(
                  children: searchResults.map((product) {
                    return ListTile(
                      title: Text(product.title),
                      onTap: () {
                        setState(() {
                          isProductSelected = true;
                        });
                        Navigator.pushNamed(
                          context,
                          DetailsScreen.routeName,
                          arguments: ProductDetailsArguments(product: product),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
