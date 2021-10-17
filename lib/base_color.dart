import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:survey_app/services/hex_color.dart';

class BaseColor {
  static final Color primary = HexColor("#ff4d4d");
  static final Color dark_gray = HexColor("#909090");
  static final Color background = HexColor("#ffffff");
  static final List<Color> baseGradient = [
    Colors.blueAccent,
    Colors.cyanAccent
  ];
  static final List<Color> secondGradient = [
    Colors.blueAccent,
    Colors.cyanAccent
  ];
}
