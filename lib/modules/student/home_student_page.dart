import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:physics/modules/student/profile2.dart';
import '../../Firebase/auth.dart';
import 'home2.dart';

class home_student extends StatefulWidget {
  home_student({super.key});

  @override
  State<home_student> createState() => _HomeScreenState();
}
final user = FirebaseAuth.instance.currentUser!;

class _HomeScreenState extends State<home_student>{
  CollectionReference usersRef =FirebaseFirestore.instance.collection('users');
  int currentIndex=1;
  List<Widget> bottomBody =
  [
    profile2(),
    Home2(),
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
            BottomNavigationBarItem(icon: Icon(Icons.chat),
                label: 'profile'
            ),
            BottomNavigationBarItem(icon: Icon(Icons.home),
                label: 'home'
            ),
          ]),
      body: bottomBody[currentIndex],
    );
  }
}
