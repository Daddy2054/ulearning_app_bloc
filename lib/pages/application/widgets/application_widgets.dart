import 'package:flutter/material.dart';
import 'package:ulearning_app_bloc/pages/home/home_page.dart';
import 'package:ulearning_app_bloc/pages/profile/profile.dart';

Widget buildPage(int index) {
  List<Widget> widget = [
    const HomePage(),
    const Text('Search'),
    const Text('Course'),
    const Text('chat'),
    const ProfilePage(),
  ];

  return widget[index];
}

var bottomTabs = const [
  BottomNavigationBarItem(
    label: 'Home',
    icon: Icon(Icons.home),
  ),
  BottomNavigationBarItem(
    label: 'Search',
    icon: Icon(Icons.search),
  ),
  BottomNavigationBarItem(
    label: 'Play',
    icon: Icon(Icons.play_arrow),
  ),
  BottomNavigationBarItem(
    label: 'Chat',
    icon: Icon(Icons.message),
  ),
  BottomNavigationBarItem(
    label: 'Profile',
    icon: Icon(Icons.person),
  ),
];
