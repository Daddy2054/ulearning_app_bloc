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
