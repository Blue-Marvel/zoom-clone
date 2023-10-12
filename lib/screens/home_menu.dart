import 'package:flutter/material.dart';
import 'package:zoom_clone/screens/home.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/utils/page_list.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({super.key});

  static const routeName = '/home-menu';
  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[_page],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _page = value;
          });
        },
        backgroundColor: footerColor,
        elevation: 0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _page,
        type: BottomNavigationBarType.shifting,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.comment_bank), label: 'Meet & Chat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.lock_clock), label: 'Meeting'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Contacts'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined), label: 'Settings'),
        ],
      ),
    );
  }
}
