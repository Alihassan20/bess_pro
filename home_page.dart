import 'package:bees/View/botom_navigation_bar/artist.dart';
import 'package:bees/View/botom_navigation_bar/health.dart';
import 'package:bees/View/botom_navigation_bar/politics.dart';
import 'package:bees/View/botom_navigation_bar/sports.dart';
import 'package:bees/model/list_of_artical.dart';
import 'package:bees/server/news_api.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import 'details_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _tabBarIndex = 0;
  List<Widget> screens=[
    const Sports(),
    const Artist(),
    const Health(),
    const Science(),
  ];
  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.flip,
        items: const [
          TabItem(
              title:"Sports", icon: Icon(Icons.sports_baseball)),
          TabItem(
              title:"art News", icon: Icon(Icons.movie)),
          TabItem(
              title:"Business", icon: Icon(Icons.business)),
          TabItem(
              title:"Science", icon: Icon(Icons.science)),

        ],
        elevation: 0,
        activeColor: Colors.black87,
        backgroundColor:const Color.fromRGBO(218, 221, 252, 1).withOpacity(0.9) ,
        initialActiveIndex: _tabBarIndex,
        onTap: (value) {
          setState(() {
            _tabBarIndex = value;
          });
        },

      ),
      appBar: AppBar(
        flexibleSpace:Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    const Color.fromRGBO(46, 76, 109, 1).withOpacity(0.9),
                    const Color.fromRGBO(57, 110, 176, 1).withOpacity(0.5),
                    const Color.fromRGBO(218, 221, 252, 1).withOpacity(0.8),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: const [0, 0.5, 1])),
        ),

        title: const Text.rich(TextSpan(children: [
          TextSpan(
            text: "News",
            style: TextStyle(
                color: Color.fromRGBO(46, 76, 109, 1),
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
          TextSpan(
              text: " App",
              style: TextStyle(color: Color.fromRGBO(218, 221, 252, 1),fontSize: 25,fontWeight: FontWeight.bold))
        ])),
        centerTitle: true,
      ),
      body: screens[_tabBarIndex],
    );
  }
}
