import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:survey_app/base_color.dart';

class InputContainer extends StatefulWidget {
  const InputContainer({Key? key, this.child, this.color}) : super(key: key);
  final child;
  final color;

  @override
  _InputContainerState createState() => _InputContainerState();
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('child', child));
  }
}

class _InputContainerState extends State<InputContainer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: BaseColor.background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: widget.child,
      width: size.width * 0.8,
    );
  }
}
