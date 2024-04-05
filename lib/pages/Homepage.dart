import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/cart_helper.dart';
import 'package:flutter_application_1/pages/CartPage.dart';
import 'package:flutter_application_1/pages/UserPage.dart';
import 'package:flutter_application_1/screens/signup_screen.dart';
import 'package:flutter_application_1/widgets/CategoriesWidget.dart';
import 'package:flutter_application_1/widgets/DefaultWidget.dart';
import 'package:flutter_application_1/widgets/Drawer.dart';
import 'package:flutter_application_1/widgets/HomeAppBar.dart';
import 'package:flutter_application_1/widgets/HomeContentWid.dart';
import 'package:flutter_application_1/widgets/ItemsWidget.dart';
import 'package:flutter_application_1/widgets/UserPageWid.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  int _page = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _loadWidget(int index) {
    var nameWidgets = "Home";
    switch (index) {
      case 0:
        nameWidgets = "Home";
        return HomeContentWidget();
      /*case 1:
        nameWidgets = "Contact";
        return;*/
      case 1:
        nameWidgets = "Notification";
      case 2:
        {
          return const UserPageWidget();
        }
      default:
        nameWidgets = "None";
        break;
    }
    return DefaultWidget(title: nameWidgets);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      body: _loadWidget(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          /*BottomNavigationBarItem(
              icon: Icon(Icons.contact_mail), label: 'Contact'),*/
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_sharp), label: 'Notification'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'User'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF4C53A5),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
      // body: _loadWidget(_selectedIndex),
    );
  }
}
