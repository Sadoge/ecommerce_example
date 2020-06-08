import 'package:ecommerce_example/models/product.dart';
import 'package:ecommerce_example/styles.dart';
import 'package:ecommerce_example/widgets/price_tag.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProductListItem extends StatelessWidget {
  final Product product;
  final Function onTap;

  const ProductListItem({
    Key key,
    this.product,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 140,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 140,
              decoration: BoxDecoration(
                color: const Color(0xFFFAFAFA),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      product.imagePath,
                    ),
                  ),
                  Positioned(
                    right: 5,
                    top: 5,
                    child: Icon(
                      MdiIcons.heart,
                      size: 16,
                      color: product.isFavourited
                          ? accentColor
                          : Color(0xFFC0C0C0),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              product.category,
              style: coloredTitle,
            ),
            Text(
              product.name,
              style: subtitle,
            ),
            PriceTag(product: product),
          ],
        ),
      ),
    );
  }
}
