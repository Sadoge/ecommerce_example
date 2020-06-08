import 'package:ecommerce_example/models/product.dart';
import 'package:ecommerce_example/styles.dart';
import 'package:ecommerce_example/widgets/number_picker.dart';
import 'package:ecommerce_example/widgets/price_tag.dart';
import 'package:flutter/material.dart';

class ProductCartItem extends StatelessWidget {
  final Product product;
  final ValueChanged<int> onAmountChanged;
  final bool hasCounter;

  const ProductCartItem({
    Key key,
    this.product,
    this.onAmountChanged,
    this.hasCounter = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        product.imagePath,
        width: 120,
        fit: BoxFit.cover,
      ),
      title: Text(
        product.name,
        style: mediumSubtitle,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          PriceTag(product: product),
          const SizedBox(height: 5),
          hasCounter
              ? NumberPicker(
                  initialValue: 1,
                  maxValue: 10,
                  minValue: 1,
                  onCurrentValueChanged: (newValue) {
                    onAmountChanged(newValue);
                  },
                )
              : Container(),
        ],
      ),
    );
  }
}
