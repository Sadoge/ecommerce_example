import 'package:ecommerce_example/models/product.dart';
import 'package:ecommerce_example/styles.dart';
import 'package:ecommerce_example/widgets/basic_app_bar.dart';
import 'package:ecommerce_example/widgets/basic_button.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({Key key, this.product}) : super(key: key);

  @override
  ProductDetailPageState createState() => ProductDetailPageState();
}

class ProductDetailPageState extends State<ProductDetailPage> {
  bool _isFavourited;

  @override
  void initState() {
    super.initState();
    _isFavourited = widget.product.isFavourited;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BasicAppBar(
        trailing: (Container(
          width: 45,
          height: 45,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFFEAEAEA),
          ),
          child: IconButton(
            icon: Icon(
              MdiIcons.heart,
              size: 26,
              color: _isFavourited ? accentColor : Color(0xFFC0C0C0),
            ),
            onPressed: () {
              setState(() {
                _isFavourited = !_isFavourited;
              });
            },
          ),
        )),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(40, 0, 40, 40),
        children: <Widget>[
          Center(
            child: Image.asset(
              widget.product.imagePath,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  widget.product.name,
                  style: title,
                ),
              ),
              Text(
                "\$${widget.product.price}",
                style: mediumTitle,
              )
            ],
          ),
          const SizedBox(height: 20),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          const SizedBox(height: 20),
          Text(widget.product.description),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(40),
        child: BasicButton(
          title: "Add to Cart",
          onTap: () {},
        ),
      ),
    );
  }
}
