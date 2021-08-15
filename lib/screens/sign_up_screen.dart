import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:async/async.dart';
import 'package:camera/camera.dart';
import 'package:image_form_field/image_form_field.dart';

class SigUpScreen extends StatefulWidget {
  const SigUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  _SigUpScreenState createState() => _SigUpScreenState();
}

class _SigUpScreenState extends State<SigUpScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    // Next, initialize the controller. This returns a Future.
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(29),
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 8),
                  prefixIcon: Icon(Icons.account_box_outlined,
                      color: Color.fromARGB(100, 0, 0, 205)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(100, 0, 0, 205), width: 2),
                      borderRadius: BorderRadius.circular(24)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(24)),
                ),
              ),
              width: size.width * 0.8,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(29),
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 8),
                  prefixIcon: Icon(Icons.account_box_outlined,
                      color: Color.fromARGB(100, 0, 0, 205)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(100, 0, 0, 205), width: 2),
                      borderRadius: BorderRadius.circular(24)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(24)),
                ),
              ),
              width: size.width * 0.8,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(29),
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 8),
                  prefixIcon: Icon(Icons.account_box_outlined,
                      color: Color.fromARGB(100, 0, 0, 205)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(100, 0, 0, 205), width: 2),
                      borderRadius: BorderRadius.circular(24)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(24)),
                ),
              ),
              width: size.width * 0.8,
            ),
          ],
        ),
      ),
    );
  }
}
