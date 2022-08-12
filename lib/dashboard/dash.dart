import 'package:flutter/material.dart';
import 'package:postit/dashboard/homepage.dart';
import 'coming_soon.dart';
import 'profile.dart';

class Dash extends StatefulWidget {
  const Dash({Key? key}) : super(key: key);

  @override
  State<Dash> createState() => _DashState();
}

class _DashState extends State<Dash> {
  int index = 0;
  final screens = [
    const HomePage(),
    const Comingsoon(),
    const Comingsoon(),
    const Profile(),
  ];
  //final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: screens[index],
        bottomNavigationBar: NavigationBarTheme(
          data: const NavigationBarThemeData(
            indicatorColor: Colors.white,
            height: 60,
          ),
          child: NavigationBar(
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: const [
              NavigationDestination(
                  icon: Icon(
                    Icons.chair_outlined,
                  ),
                  selectedIcon: Icon(
                    Icons.chair,
                    color: Colors.yellow,
                  ),
                  label: 'Home'),
              NavigationDestination(
                  icon: Icon(
                    Icons.alarm,
                  ),
                  selectedIcon: Icon(
                    Icons.alarm_add_rounded,
                    color: Colors.yellow,
                  ),
                  label: 'Notifiy'),
              NavigationDestination(
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                  ),
                  selectedIcon: Icon(
                    Icons.shopping_cart,
                    color: Colors.yellow,
                  ),
                  label: 'Cart'),
              NavigationDestination(
                  icon: Icon(
                    Icons.person_outline,
                  ),
                  selectedIcon: Icon(
                    Icons.person,
                    color: Colors.yellow,
                  ),
                  label: 'Profile'),
            ],
          ),
        ),
      );
}
