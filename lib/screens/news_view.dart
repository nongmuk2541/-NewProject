import 'package:New_Project_KMUTTNEWS/tabview/latestNews_tab_view.dart';
import 'package:New_Project_KMUTTNEWS/tabview/post_news_tab.dart';
import 'package:New_Project_KMUTTNEWS/tabview/trend_news_header.dart';
import 'package:New_Project_KMUTTNEWS/screens/login_view.dart';

import 'package:flutter/material.dart';

import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class News extends StatefulWidget {
  static const routeName = '/news';
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
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
      //-----------------------------------------------------Tabbar View-------------------------------------------------------------
      body: Column(
        children: <Widget>[
          TrendNewsHeader(),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 19.0),
              child: Text(
                "ข่าวสารล่าสุด",
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
          // Text(
          //   "ข่าวสารล่าสุด",
          //   style: kNonActiveTabStyle,
          // ),
          Expanded(
            child: LatestNewsTabView(),
          ),
        ],
      ),
      // --------------------------------------------add text------------------------------------------------------
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNews()),
          );
        },
        child: Icon(Icons.border_color),
        backgroundColor: Colors.orange,
      ),
    );
  }
}
