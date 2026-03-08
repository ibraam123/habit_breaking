import 'package:flutter/material.dart';
import 'package:habit_breaking/core/widgets/custom_bottom_navbar.dart';
import 'package:habit_breaking/features/home/preseantation/views/home_view.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  List<Widget> pages = [
    const HomeView(),
    const Placeholder(),
    const Placeholder(),
  ];

   int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white ,
      body: pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(currentIndex: _currentIndex, onItemTapped: (index) {
        setState(() {
          _currentIndex = index;
        });
      }),
    );
  }
}



