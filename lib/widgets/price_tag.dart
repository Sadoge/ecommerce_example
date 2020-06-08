import 'package:ecommerce_example/models/product.dart';
import 'package:ecommerce_example/styles.dart';
import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget {
  final Product product;

  const PriceTag({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          "USD${product.price}",
          style: price,
        ),
        const SizedBox(width: 10),
        product.hasDiscount
            ? Text(
                "USD${product.oldPrice}",
                style: oldPrice,
              )
            : Container()
      ],
    );
  }
}
