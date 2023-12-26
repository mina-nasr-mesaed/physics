import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:physics/modules/Authentication/splash_screen.dart';

import '../modules/admin/home_screen.dart';
import '../modules/Authentication/login_screen.dart';

class Auth extends StatefulWidget {
  @override
  State<Auth> createState() => _AuthState();
}
final user = FirebaseAuth.instance.currentUser!;

class _AuthState extends State<Auth> {
  List users =[];
  CollectionReference usersRef =FirebaseFirestore.instance.collection('users');
  getData() async {
    var responsbody = await usersRef.get();
    responsbody.docs.forEach((element) {
      setState(() {
        users.add(element.data());
      });
    });
    print(users);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
           // if(users[0]["admin"]== true){
              return HomeScreen();
           // }
          } else {
            return LoginPage();
          }
        }),
      ),
    );
  }
}
