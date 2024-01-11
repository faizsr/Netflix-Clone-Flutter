import 'package:flutter/material.dart';

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
            items: [
              bottomNavigationBarItem(
                  icon: 'assets/icons/hut.png', label: 'Home', width: 23),
              bottomNavigationBarItem(
                  icon: 'assets/icons/play.png', label: 'New & Hot'),
              bottomNavigationBarItem(
                  icon: 'assets/icons/smile.png', label: 'Fast Laughs'),
              bottomNavigationBarItem(
                  icon: 'assets/icons/search.png', label: 'Search'),
              bottomNavigationBarItem(
                  icon: 'assets/icons/down-arrow.png', label: 'Downloads'),
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
