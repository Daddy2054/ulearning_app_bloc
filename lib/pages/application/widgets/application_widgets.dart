import 'package:flutter/material.dart';

Widget buildPage(int index) {
  List<Widget> widget = [
    const Text('Home'),
    const Text('Search'),
    const Text('Course'),
    const Text('chat'),
    const Text('profile'),
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
