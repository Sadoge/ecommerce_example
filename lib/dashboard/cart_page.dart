import 'package:ecommerce_example/models/product.dart';
import 'package:ecommerce_example/styles.dart';
import 'package:ecommerce_example/widgets/basic_button.dart';
import 'package:ecommerce_example/widgets/product_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CartPage extends StatefulWidget {
  CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Product> _products = [
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
  final Map<Product, int> _productAmount = {};

  @override
  void initState() {
    super.initState();
    for (var item in _products) {
      _productAmount[item] = 1;
    }
  }

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
            itemCount: _products.length,
            separatorBuilder: (context, index) {
              return Divider(
                height: 40,
                color: Colors.grey,
              );
            },
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(_products[index].name),
                child: ProductCartItem(
                  product: _products[index],
                  onAmountChanged: (newAmount) {
                    setState(() {
                      _productAmount[_products[index]] = newAmount;
                    });
                  },
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
                        "Remove from cart",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                onDismissed: (direction) {
                  setState(() {
                    _productAmount.remove(_products[index]);
                    _products.remove(_products[index]);
                  });
                },
              );
            },
          ),
          const Divider(
            color: Colors.grey,
            height: 40,
          ),
          Text(
            "Total items: ${_getTotalItems()} items",
            style: subtitle.copyWith(color: primaryColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            "Total Price: \$${_getTotalPrice()}",
            style: boldMediumSubtitle,
            textAlign: TextAlign.center,
          ),
          Spacer(),
          BasicButton(
            title: "Proceed to Checkout",
            onTap: () {},
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  int _getTotalItems() {
    var total = 0;
    for (var key in _productAmount.keys) {
      total += _productAmount[key];
    }
    return total;
  }

  double _getTotalPrice() {
    var total = 0.0;
    for (var key in _productAmount.keys) {
      total += (_productAmount[key] * key.price);
    }
    return total;
  }
}
