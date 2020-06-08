import 'package:ecommerce_example/models/product.dart';
import 'package:ecommerce_example/product/product_detail_page.dart';
import 'package:ecommerce_example/styles.dart';
import 'package:ecommerce_example/widgets/product_list_item.dart';
import 'package:flutter/material.dart';

class ProductsHorizontalListView extends StatefulWidget {
  final String title;

  const ProductsHorizontalListView({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  _ProductsHorizontalListViewState createState() =>
      _ProductsHorizontalListViewState();
}

class _ProductsHorizontalListViewState
    extends State<ProductsHorizontalListView> {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 275,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  widget.title,
                  style: title,
                ),
              ),
              Text(
                "View all",
                style: coloredTitle,
              )
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              itemCount: _products.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return const SizedBox(width: 20);
              },
              itemBuilder: (context, index) {
                return ProductListItem(
                  product: _products[index],
                  onTap: () async {
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                          product: _products[index],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
