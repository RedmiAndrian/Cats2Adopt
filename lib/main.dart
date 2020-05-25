import 'package:cats/pages/bottom_navigation_bar_controller.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  title: 'CATS 2 ADOPT',
  theme: ThemeData(
    primarySwatch: Colors.purple,
  ),
  debugShowCheckedModeBanner: false,
  home: BottomNavigationBarController(),
));

