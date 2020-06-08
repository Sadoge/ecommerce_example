import 'package:ecommerce_example/styles.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BasicMenuItem extends StatelessWidget {
  final IconData iconData;
  final String title;
  final Function onTap;

  const BasicMenuItem({
    Key key,
    this.iconData,
    this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: <Widget>[
          Icon(
            iconData,
            color: primaryColor,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: mediumSubtitle,
            ),
          ),
          Icon(
            MdiIcons.chevronRight,
            color: primaryColor,
          )
        ],
      ),
    );
  }
}
