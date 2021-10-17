import 'package:flutter/material.dart';
import 'package:survey_app/widgets/s_text_field.dart';

class GradientMark extends StatelessWidget {
  GradientMark(this.child, {required this.gradient, this.style});

  final child;
  final Gradient gradient;
  final style;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        shaderCallback: (bounds) => gradient.createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            ),
        child: child);
  }
}
