import 'package:New_Project_KMUTTNEWS/constants.dart';
import 'package:New_Project_KMUTTNEWS/tabview/latestAct_tab_view.dart';
import 'package:New_Project_KMUTTNEWS/tabview/post_activity_tab.dart';
import 'package:New_Project_KMUTTNEWS/tabview/trend_activities_header.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:New_Project_KMUTTNEWS/screens/login_view.dart';
import 'package:flutter/material.dart';

class Activities extends StatefulWidget {
  static const routeName = '/activities';
  @override
  _ActivitiesState createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "KMUTT NEWS",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Itim',
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              onPressed: null),
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: null),
          Text(
            auth.currentUser.email,
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'Itim',
              color: Colors.white,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.login_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              auth.signOut().then((value) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return Login();
                }));
              });
            },
          ),
        ],
      ),
      // --------------------------------Tabbar View--------------------------------
      body: Column(
        children: <Widget>[
          TrendActivitiesHeader(),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 19.0),
              child: Text(
                "กิจกรรมล่าสุด",
                style: kNonActiveTabStyle,
              ),
            ),
          ),
          Divider(
            color: Colors.grey[500],
            indent: 15,
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: LatestActTabView(),
          )
        ],
      ),
      // --------------------------------------------add text------------------------------------------------------
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddActivities()));
        },
        child: Icon(Icons.border_color),
        backgroundColor: Colors.orange,
      ),
    );
  }
}
