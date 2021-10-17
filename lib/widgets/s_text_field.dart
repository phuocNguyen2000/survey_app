import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:survey_app/base_color.dart';

class XTextField extends StatefulWidget {
  const XTextField(
      {Key? key,
      this.controller,
      this.hintText,
      this.icon,
      this.onchange,
      this.obscureText})
      : super(key: key);
  final controller;
  final hintText;
  final icon;
  final onchange;
  final obscureText;

  @override
  _XTextFieldState createState() => _XTextFieldState();
}

class _XTextFieldState extends State<XTextField> {
  bool obscure = false;
  @override
  void initState() {
    if (widget.obscureText != null) {
      this.setState(() {
        this.obscure = widget.obscureText;
      });
    } else {
      this.obscure = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: this.obscure,
      style: GoogleFonts.openSans(
          textStyle: TextStyle(
              color: Colors.black45,
              fontSize: 16,
              fontWeight: FontWeight.w600)),
      onChanged: widget.onchange,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        contentPadding: EdgeInsets.symmetric(vertical: 8),
        prefixIcon: Icon(widget.icon, color: Colors.white),
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.greenAccent, width: 1),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
