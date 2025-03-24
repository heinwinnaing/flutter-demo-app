import 'package:flutter/material.dart';
import 'package:mpoints_app/features/home/screens/home_screen.dart';
import 'package:mpoints_app/features/profile/screen/profile_screen.dart';
import 'package:mpoints_app/features/settings/screen/setting_screen.dart';
import 'package:mpoints_app/features/shops/screen/shop_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key, required this.page});
  final int page;

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentIndex = 0;
  List pages = const [HomeScreen(), ShopScreen(), ProfileScreen(), SettingScreen()];

  @override
  void initState() {
    super.initState();
    currentIndex = widget.page;
  }

  void onTap(int value) {
    setState(() {
      currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        backgroundColor: const Color.fromRGBO(148, 253, 241, 1),
        unselectedItemColor: Colors.grey,
        selectedItemColor: const Color.fromRGBO(19, 191, 170, 1),
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        selectedLabelStyle:
            const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        items: [
          BottomNavigationBarItem(
              label: 'Home',
              icon: Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 10, right: 10, bottom: 5),
                  child: Image.asset(
                    'assets/icons/home${currentIndex == 0 ? '-active' : ''}.png',
                    width: 24,
                    height: 24,
                  ),
                ),
              )),
          BottomNavigationBarItem(
              label: 'Shop',
              icon: Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 10, right: 10, bottom: 5),
                  child: Image.asset(
                    'assets/icons/shop${currentIndex == 1 ? '-active' : ''}.png',
                    width: 24,
                    height: 24,
                  ),
                ),
              )),
          BottomNavigationBarItem(
              label: 'Profile',
              icon: Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 10, right: 10, bottom: 5),
                  child: Image.asset(
                    'assets/icons/profile${currentIndex == 2 ? '-active' : ''}.png',
                    width: 24,
                    height: 24,
                  ),
                ),
              )),
          BottomNavigationBarItem(
              label: 'More',
              icon: Center(
                child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10, left: 10, right: 10, bottom: 5),
                    child: Image.asset(
                      'assets/icons/menu${currentIndex == 3 ? '-active' : ''}.png',
                      width: 24,
                      height: 24,
                    )),
              )),
        ],
      ),
    );
  }
}
