import 'package:flutter/material.dart';
import 'package:survey_app/base_color.dart';

class XTextField extends StatefulWidget {
  const XTextField({Key? key, this.controller, this.hintText, this.icon})
      : super(key: key);
  final controller;
  final hintText;
  final icon;

  @override
  _XTextFieldState createState() => _XTextFieldState();
}

class _XTextFieldState extends State<XTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        contentPadding: EdgeInsets.symmetric(vertical: 8),
        prefixIcon: Icon(widget.icon, color: BaseColor.primary),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: BaseColor.primary, width: 1),
            borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 0),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
