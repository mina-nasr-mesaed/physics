import 'package:flutter/material.dart';

import 'bottom navgator_screens/home.dart';
import 'bottom navgator_screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex=1;
  List<Widget> bottomBody =
  [
    profile(),
    Home(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            currentIndex=index;
          });
        },
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.person),
              label: 'profile'
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person),
                label: 'home'
            ),
          ]),
      body: bottomBody[currentIndex],
    );
  }
}
