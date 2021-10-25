import 'package:flutter/material.dart';

class AccountInforScreen extends StatefulWidget {
  const AccountInforScreen({Key? key}) : super(key: key);

  @override
  _AccountInforScreenState createState() => _AccountInforScreenState();
}

class _AccountInforScreenState extends State<AccountInforScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        child: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
      ),
    ));
  }
}
