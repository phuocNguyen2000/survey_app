import 'package:flutter/material.dart';
import 'package:survey_app/base_color.dart';

import 'package:survey_app/widgets/container_gradient_border.dart';
import 'package:survey_app/widgets/gradien_mark.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key, this.signOut}) : super(key: key);
  final signOut;

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            decoration: BoxDecoration(),
            child: Container(
              width: double.infinity,
              height: 290.0,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg",
                      ),
                      radius: 50.0,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    GradientMark(
                        Text(
                          "Alice James",
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.white,
                          ),
                        ),
                        gradient: LinearGradient(
                            colors: [Colors.blueAccent, Colors.cyanAccent])),
                    SizedBox(
                      height: 10.0,
                    ),
                    Card(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                      clipBehavior: Clip.antiAlias,
                      color: Colors.white,
                      elevation: 5.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 22.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Posts",
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "5200",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.pinkAccent,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Followers",
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "28.5K",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.pinkAccent,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "Follow",
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "1300",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.pinkAccent,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
        Container(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                    onTap: () {},
                    child: ContainerGradientBorder(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 50,
                      gradient: LinearGradient(
                          colors: [Colors.blueAccent, Colors.cyanAccent]),
                      intColor: Colors.white,
                      borderRadius: 10.0,
                      child: Center(
                          child: Text(
                        "Sign Out",
                        style: TextStyle(
                          color: BaseColor.primary,
                          fontSize: 20,
                        ),
                      )),
                    )),
                GestureDetector(
                    onTap: () {},
                    child: ContainerGradientBorder(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 50,
                      gradient: LinearGradient(
                          colors: [Colors.blueAccent, Colors.cyanAccent]),
                      intColor: Colors.white,
                      borderRadius: 10.0,
                      child: Center(
                          child: Text(
                        "Sign Out",
                        style: TextStyle(
                          color: BaseColor.primary,
                          fontSize: 20,
                        ),
                      )),
                    )),
                GestureDetector(
                    onTap: () async {
                      widget.signOut();
                    },
                    child: ContainerGradientBorder(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 50,
                      gradient: LinearGradient(
                          colors: [Colors.blueAccent, Colors.cyanAccent]),
                      intColor: Colors.white,
                      borderRadius: 10.0,
                      child: Center(
                          child: Text(
                        "Sign Out",
                        style: TextStyle(
                          color: BaseColor.primary,
                          fontSize: 20,
                        ),
                      )),
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
