import 'package:ecommerce_example/widgets/category_search_bar.dart';
import 'package:ecommerce_example/product/products_horizontal_list_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(30),
      children: <Widget>[
        const SizedBox(height: 20),
        CategorySearchBar(),
        const SizedBox(height: 20),
        ProductsHorizontalListView(
          title: 'Most selling',
        ),
        ProductsHorizontalListView(
          title: 'Recently added',
        ),
      ],
    );
  }
}
