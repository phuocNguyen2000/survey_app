import 'package:flutter/material.dart';

class LoginBackground extends StatelessWidget {
  const LoginBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            child: Transform.translate(
                offset: Offset(-50.0, -MediaQuery.of(context).size.width / 5),
                child: Transform.scale(
                  scale: 1.35,
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.4,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                        color: Colors.cyan[100],
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width)),
                  ),
                ))),
        Positioned(
            child: Transform.translate(
                offset: Offset(MediaQuery.of(context).size.width * 0.8,
                    MediaQuery.of(context).size.width),
                child: Transform.scale(
                  scale: 1.35,
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.4,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                        color: Colors.cyan[100],
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width)),
                  ),
                ))),
        Positioned(
            child: Transform.translate(
                offset: Offset(-50, MediaQuery.of(context).size.width * 1.5),
                child: Transform.scale(
                  scale: 1.35,
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.4,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                        color: Colors.cyan[100],
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width)),
                  ),
                ))),
      ],
    );
  }
}
