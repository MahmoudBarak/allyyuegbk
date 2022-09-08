import 'package:allyyuegbk/Screens/Home.dart';
import 'package:allyyuegbk/Screens/profile.dart';
import 'package:allyyuegbk/Screens/wisheList.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Bar extends StatefulWidget {
  const Bar({Key? key}) : super(key: key);

  @override
  State<Bar> createState() => _BarState();
}

class _BarState extends State<Bar> {
  @override
  int index1=0;
  final Screens=[
    HomeScreen(),
    WishList(),
    Profile(),

  ];
  Widget build(BuildContext context) {

    return Scaffold(
      body: Screens[index1],
      bottomNavigationBar: GNav(
          backgroundColor: Colors.white,
          gap: 8,
          activeColor: Colors.orange,
          iconSize: 24,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          duration: Duration(milliseconds: 400),
          tabBackgroundColor: Colors.orange.shade50,
          color: Colors.grey.shade500,
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
              textColor: Colors.orange,
            ),
            GButton(
              icon: Icons.favorite,
              text: 'WishList',
              textColor: Colors.orange,
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
              textColor: Colors.orange,
            ),
          ],
          selectedIndex: index1,
          onTabChange: (index) {
            setState(() {
              index1 = index;
            });
          },
        ),



    );
  }
}
