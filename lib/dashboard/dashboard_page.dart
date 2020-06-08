import 'package:ecommerce_example/dashboard/cart_page.dart';
import 'package:ecommerce_example/dashboard/favourites_page.dart';
import 'package:ecommerce_example/dashboard/home_page.dart';
import 'package:ecommerce_example/dashboard/profile_page.dart';
import 'package:ecommerce_example/styles.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<Widget> _pages = [
    HomePage(),
    CartPage(),
    FavouritesPage(),
    ProfilePage(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: _pages[_currentIndex],
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey.shade200,
              ),
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            backgroundColor: Colors.white,
            unselectedFontSize: 12,
            selectedFontSize: 12,
            selectedItemColor: primaryColor,
            unselectedItemColor: Color(0xFFC0C0C0),
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(MdiIcons.home),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(MdiIcons.cart),
                title: Text('Cart'),
              ),
              BottomNavigationBarItem(
                icon: Icon(MdiIcons.heart),
                title: Text('Favourites'),
              ),
              BottomNavigationBarItem(
                icon: Icon(MdiIcons.account),
                title: Text('Profile'),
              ),
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
