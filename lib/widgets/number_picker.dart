import 'package:ecommerce_example/styles.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NumberPicker extends StatefulWidget {
  final int initialValue;
  final int minValue;
  final int maxValue;
  final ValueChanged<int> onCurrentValueChanged;

  NumberPicker({
    Key key,
    this.initialValue,
    this.minValue,
    @required this.maxValue,
    this.onCurrentValueChanged,
  }) : super(key: key);

  @override
  _NumberPickerState createState() => _NumberPickerState();
}

class _NumberPickerState extends State<NumberPicker> {
  int _currentValue;

  @override
  void initState() {
    _currentValue = widget.initialValue ?? widget.minValue ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xFFEAEAEA),
      ),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(
              MdiIcons.minus,
              size: 10,
              color: primaryColor,
            ),
            onPressed: () {
              if (_currentValue > widget.minValue ?? 0) {
                setState(() {
                  _currentValue--;
                });
                widget.onCurrentValueChanged(_currentValue);
              }
            },
          ),
          Expanded(
            child: Text(
              _currentValue.toString(),
              style: subtitle,
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(
            icon: Icon(
              MdiIcons.plus,
              size: 10,
              color: primaryColor,
            ),
            onPressed: () {
              if (_currentValue < widget.maxValue) {
                setState(() {
                  _currentValue++;
                });
                widget.onCurrentValueChanged(_currentValue);
              }
            },
          ),
        ],
      ),
    );
  }
}
