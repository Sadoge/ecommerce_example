import 'package:ecommerce_example/styles.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CategorySearchBar extends StatefulWidget {
  CategorySearchBar({Key key}) : super(key: key);

  @override
  _CategorySearchBarState createState() => _CategorySearchBarState();
}

class _CategorySearchBarState extends State<CategorySearchBar> {
  List<String> _catergories = [
    'Watches',
    'Bracelets',
    'Straps',
    'Set',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Text('Select from categories', style: title),
            ),
            IconButton(
              padding: const EdgeInsets.all(0),
              icon: Icon(
                MdiIcons.magnify,
                color: primaryColor,
              ),
              onPressed: () {},
            )
          ],
        ),
        const SizedBox(height: 10),
        Container(
          height: 40,
          child: ListView.separated(
            padding: const EdgeInsets.all(0),
            itemCount: _catergories.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return const SizedBox(width: 10);
            },
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.5),
                  border: Border.all(
                    color: Color(0xFF586BCA).withOpacity(0.25),
                  ),
                ),
                child: FlatButton(
                  child: Text(
                    _catergories[index],
                    style: coloredTitle,
                  ),
                  onPressed: () {},
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
