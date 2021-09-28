import 'package:flutter/material.dart';

class ContainerGradientBorder extends StatefulWidget {
  final double borderRadius;
  final double width;
  final double height;
  final child;
  final intColor;
  final gradient;

  const ContainerGradientBorder(
      {Key? key,
      required this.borderRadius,
      required this.width,
      required this.height,
      this.child,
      this.intColor,
      this.gradient})
      : super(key: key);

  @override
  _ContainerGradientBorderState createState() =>
      _ContainerGradientBorderState();
}

class _ContainerGradientBorderState extends State<ContainerGradientBorder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: widget.width,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              child: widget.child,
              decoration: BoxDecoration(
                color: widget.intColor,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
            ),
          ),
          height: widget.height,
          decoration: BoxDecoration(
              gradient: widget.gradient,
              border: Border.all(
                color:
                    Colors.transparent, //kHintColor, so this should be changed?
              ),
              borderRadius: BorderRadius.circular(widget.borderRadius)),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
