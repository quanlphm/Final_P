import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/screens/signup_screen.dart';
import 'package:flutter_application_1/widgets/DefaultWidget.dart';
import 'package:flutter_application_1/widgets/UserPageWid.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        //Important: Remove any padding from the ListView
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF4C53A5),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                      'https://res.cloudinary.com/daily-now/image/upload/s--0_ODbtD2--/f_auto/v1710058033/public/Placeholder%2008'),
                ),
                SizedBox(
                  height: 8,
                ),
                Text('Lê Phan Minh Quân'),
                Text('20dh111691@st.huflit.edu.vn'),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              _selectedIndex = 0;
              setState(() {});
            },
          ),
          /* ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text('Contact'),
            onTap: () {
              Navigator.pop(context);
              _selectedIndex = 1;
              setState(() {});
            },
          ), 
          */
          ListTile(
            leading: const Icon(Icons.notifications_sharp),
            title: const Text('Notification'),
            onTap: () {
              Navigator.pop(context);
              _selectedIndex = 2;
              setState(() {});
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('User'),
            onTap: () {
              Navigator.pop(context);
              _selectedIndex = 2;
              setState(() {});
            },
          ),
          const Divider(
            color: Color(0xFF4C53A5),
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
        ],
      ),
    );
  }
}
