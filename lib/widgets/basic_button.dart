import 'package:flutter/material.dart';
import 'package:ecommerce_example/styles.dart';

class BasicButton extends StatelessWidget {
  final String title;
  final bool isInverted;
  final Function onTap;

  const BasicButton({
    Key key,
    this.title,
    this.onTap,
    this.isInverted = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: isInverted ? Colors.transparent : primaryColor,
        borderRadius: BorderRadius.circular(10),
        border: isInverted ? Border.all(color: primaryColor) : null,
      ),
      child: FlatButton(
        onPressed: onTap,
        child: Text(
          title,
          style: TextStyle(color: isInverted ? primaryColor : Colors.white),
        ),
      ),
    );
  }
}
