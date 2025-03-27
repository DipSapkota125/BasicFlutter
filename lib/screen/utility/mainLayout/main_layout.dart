import 'package:calculater_app/screen/utility/bottomNavigation/bottom_nav.dart';
import 'package:calculater_app/screen/utility/component/custom_appbar.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(), // Custom App Bar
      body: widget.child, // Dynamic body content
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
