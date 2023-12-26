import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:physics/modules/admin/post.dart';
import '../../Firebase/auth.dart';
import 'home.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
final user = FirebaseAuth.instance.currentUser!;

class _HomeScreenState extends State<HomeScreen>{
  CollectionReference usersRef =FirebaseFirestore.instance.collection('users');
  int currentIndex=1;
  List<Widget> bottomBody =
  [
    profile(),
    Home(),
    PostCreationScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: IconButton(
            color: Colors.black,
            onPressed:(){
              Navigator.of(context).pushReplacementNamed("studentview");
            }
            , icon: Icon(Icons.person_search_sharp
        )),
      ),
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
            BottomNavigationBarItem(icon: Icon(Icons.home),
                label: 'home'
            ),
            BottomNavigationBarItem(icon: Icon(Icons.chat),
                label: 'post'
            ),
          ]),
      body: bottomBody[currentIndex],
    );
  }
}
