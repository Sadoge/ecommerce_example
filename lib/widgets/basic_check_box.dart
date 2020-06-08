import 'package:ecommerce_example/styles.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BasicCheckBox extends StatefulWidget {
  final bool value;
  final String label;
  final ValueChanged<bool> onValueChanged;

  const BasicCheckBox({
    Key key,
    this.value,
    this.label,
    this.onValueChanged,
  }) : super(key: key);

  @override
  _BasicCheckBoxState createState() => _BasicCheckBoxState();
}

class _BasicCheckBoxState extends State<BasicCheckBox> {
  bool _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            setState(() {
              _currentValue = !_currentValue;
            });
            widget.onValueChanged(_currentValue);
          },
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.5),
              border: Border.all(
                color: Colors.black.withOpacity(0.1),
              ),
            ),
            child: _currentValue
                ? Center(
                    child: Icon(
                      MdiIcons.check,
                      size: 13,
                      color: Color(0xFF00BB1A),
                    ),
                  )
                : null,
          ),
        ),
        const SizedBox(width: 5),
        Text(widget.label, style: smallTitle)
      ],
    );
  }
}
