import 'package:flutter/material.dart';
import 'package:sampleloginusingapi/view/logipage.dart';
import 'package:sampleloginusingapi/view/screens/activity.dart';
import 'package:sampleloginusingapi/view/screens/overview.dart';
import 'package:sampleloginusingapi/view/screens/spenttime.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 147, 64, 255),
          actions: [IconButton(onPressed: (){
            Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>LoginPage()));
          }, icon: Icon(Icons.exit_to_app))],
          title:  Text("Timelogger"),
          bottom: const TabBar(tabs: [
            Tab(
              text: "Overview",
            ),
            Tab(
              text: "Activity",
            ),
            Tab(
              text: "Spent time",
            )
          ]),
        ),
        body:  TabBarView(children: [
          OverviewPage(),
          ActivityPage(),
          SpentTime(),
        ]),
      ),
    );
  }
}