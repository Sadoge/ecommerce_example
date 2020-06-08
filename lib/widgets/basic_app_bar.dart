import 'package:ecommerce_example/styles.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

const double kAppBarHeight = 75.0;

enum BackIconType { close, back }

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BasicAppBar({
    Key key,
    this.backIconText,
    this.onBackTap,
    this.trailing,
  }) : super(key: key);

  final String backIconText;
  final GestureTapCallback onBackTap;
  final Widget trailing;

  @override
  Size get preferredSize => _calculateAppbarHeight();

  Size _calculateAppbarHeight() {
    return const Size.fromHeight(kAppBarHeight);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.transparent,
        height: kAppBarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            InkWell(
              child: Container(
                child: BasicBackButton(
                  backIconText: backIconText ?? "Back",
                ),
                height: kAppBarHeight,
              ),
              onTap: onBackTap == null
                  ? () => Navigator.of(context).pop(null)
                  : onBackTap,
            ),
            trailing ?? Container()
          ],
        ),
      ),
    );
  }
}

class BasicBackButton extends StatelessWidget {
  const BasicBackButton({
    @required this.backIconText,
    Key key,
    this.color = Colors.black,
    this.backIconType,
  }) : super(key: key);

  final BackIconType backIconType;
  final String backIconText;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final iconData = backIconType == BackIconType.close
        ? MdiIcons.close
        : MdiIcons.chevronLeft;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const SizedBox(width: 24),
        Icon(
          iconData,
          color: primaryColor,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            backIconText,
            style: const TextStyle(
              fontSize: 16,
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
