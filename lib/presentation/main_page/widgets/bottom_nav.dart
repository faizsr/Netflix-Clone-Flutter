import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      selectedIconTheme: const IconThemeData(color: Colors.white),
      unselectedIconTheme: const IconThemeData(color: Colors.grey),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'New & Hot'),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Fast Laughs'),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Downloads')
      ],
    );
  }
}
