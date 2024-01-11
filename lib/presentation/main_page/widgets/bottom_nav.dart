import 'package:flutter/material.dart';
import 'package:netflix_clone_project/core/assets.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int newIndex, _) {
          return BottomNavigationBar(
            currentIndex: newIndex,
            onTap: (index) {
              indexChangeNotifier.value = index;
            },
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12.0,
            unselectedFontSize: 12.0,
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedIconTheme: const IconThemeData(color: Colors.white),
            unselectedIconTheme: const IconThemeData(color: Colors.grey),
            selectedLabelStyle: const TextStyle(fontSize: 11),
            unselectedLabelStyle: const TextStyle(fontSize: 11),
            items: [
              bottomNavigationBarItem(
                  icon: home, label: 'Home', width: 23),
              bottomNavigationBarItem(
                  icon: newAndHot, label: 'New & Hot'),
              bottomNavigationBarItem(
                  icon: fastLaughs, label: 'Fast Laughs'),
              bottomNavigationBarItem(
                  icon: search, label: 'Search'),
              bottomNavigationBarItem(
                  icon: downloads, label: 'Downloads'),
            ],
          );
        });
  }
}

BottomNavigationBarItem bottomNavigationBarItem(
    {required String icon, required String label, double? width}) {
  return BottomNavigationBarItem(
    icon: Container(
      padding: const EdgeInsets.only(bottom: 3),
      width: width ?? 25,
      child: Image.asset(
        icon,
        color: Colors.grey,
      ),
    ),
    activeIcon: Container(
      padding: const EdgeInsets.only(bottom: 3),
      width: width ?? 25,
      child: Image.asset(
        icon,
        color: Colors.white,
      ),
    ),
    label: label,
  );
}
