import 'package:ecommerce_example/models/product.dart';
import 'package:ecommerce_example/styles.dart';
import 'package:ecommerce_example/widgets/product_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FavouritesPage extends StatefulWidget {
  FavouritesPage({Key key}) : super(key: key);

  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  List<Product> _favourites = [
    Product(
      category: 'Bracelets',
      name: 'Black Rope Bracelet',
      imagePath: 'assets/bracelet.png',
      hasDiscount: true,
      price: 29.0,
      oldPrice: 38.0,
      isFavourited: true,
      description: "Inspired by Scandinavian design and engineering,"
          "the ontpellier watch is a quality-built accessory for everyday wear."
          "This handmade timepiece has crystal quartz movement, blue crocodile-embossed leather strap and silver water resistant stainless steel case"
          "Whether you slip it on solo or with a stack of  Grand Frank bangles, the result is timeless.",
    ),
    Product(
      category: 'Watches',
      name: 'Kinsale Watch',
      imagePath: 'assets/watch.png',
      hasDiscount: true,
      price: 185.0,
      oldPrice: 230.0,
      isFavourited: false,
      description: "Inspired by Scandinavian design and engineering,"
          "the ontpellier watch is a quality-built accessory for everyday wear."
          "This handmade timepiece has crystal quartz movement, blue crocodile-embossed leather strap and silver water resistant stainless steel case"
          "Whether you slip it on solo or with a stack of  Grand Frank bangles, the result is timeless.",
    ),
    Product(
      category: 'Bracelets',
      name: 'Black Stone Bead',
      imagePath: 'assets/bracelet.png',
      hasDiscount: true,
      price: 24.0,
      oldPrice: 49.0,
      isFavourited: true,
      description: "Inspired by Scandinavian design and engineering,"
          "the ontpellier watch is a quality-built accessory for everyday wear."
          "This handmade timepiece has crystal quartz movement, blue crocodile-embossed leather strap and silver water resistant stainless steel case"
          "Whether you slip it on solo or with a stack of  Grand Frank bangles, the result is timeless.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(height: 60),
          ListView.separated(
            padding: const EdgeInsets.all(0),
            shrinkWrap: true,
            itemCount: _favourites.length,
            separatorBuilder: (context, index) {
              return Divider(
                height: 40,
                color: Colors.grey,
              );
            },
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(_favourites[index].name),
                child: ProductCartItem(
                  product: _favourites[index],
                  hasCounter: false,
                ),
                background: Container(
                  color: accentColor,
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 125,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              MdiIcons.delete,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Remove from Favourites",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                onDismissed: (direction) {
                  setState(() {
                    _favourites.remove(_favourites[index]);
                  });
                },
              );
            },
          ),
          const Divider(
            color: Colors.grey,
            height: 40,
          ),
        ],
      ),
    );
  }
}
