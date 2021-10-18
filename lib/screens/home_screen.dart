import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey_app/controllers/home/home_controller.dart';
import 'package:survey_app/generated/l10n.dart';
import 'package:survey_app/screens/account_screen.dart';

import 'package:survey_app/widgets/home_tab_body.dart';

import 'package:survey_app/widgets/survey_tab_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = Get.put(HomeController());
  void signOut() async {
    _controller.signOut();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: TabBarView(children: [
            HomeTabBody(),
            AccountScreen(
              signOut: signOut,
            ),
          ]),
          bottomNavigationBar: TabBar(
              unselectedLabelColor: Colors.redAccent,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.blueAccent, Colors.cyanAccent]),
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.redAccent),
              tabs: [
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("HOME"),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(S.current.account.toUpperCase()),
                  ),
                ),
              ]),
        ));
  }
}
