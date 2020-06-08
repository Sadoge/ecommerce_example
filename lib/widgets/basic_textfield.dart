import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BasicTextField extends StatefulWidget {
  final TextEditingController controller;
  final IconData iconData;
  final String placeholder;
  final bool obscureText;
  final bool canToggleObscureText;
  final Function onCompleted;

  const BasicTextField({
    Key key,
    this.controller,
    this.iconData,
    this.placeholder,
    this.obscureText = false,
    this.canToggleObscureText = false,
    this.onCompleted,
  }) : super(key: key);

  @override
  _BasicTextFieldState createState() => _BasicTextFieldState();
}

class _BasicTextFieldState extends State<BasicTextField> {
  bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.placeholder,
        hasFloatingPlaceholder: false,
        prefixIcon: widget.iconData != null
            ? Icon(
                widget.iconData,
                color: const Color(0xFF1B2A3B).withOpacity(0.4),
              )
            : null,
        suffixIcon: widget.canToggleObscureText
            ? GestureDetector(
                child: Icon(
                  _obscureText ? MdiIcons.eyeOutline : MdiIcons.eyeOffOutline,
                  color: const Color(0xFF1B2A3B).withOpacity(0.4),
                ),
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.black.withOpacity(0.1)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      style: TextStyle(fontSize: 12),
      obscureText: _obscureText,
      onEditingComplete: () {
        widget.onCompleted();
        FocusScope.of(context).requestFocus(FocusNode());
      },
    );
  }
}
