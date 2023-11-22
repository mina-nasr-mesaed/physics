import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Firebase/auth.dart';

class profile extends StatelessWidget {
  final User ? user = Auth().currentUser;

  Future<void> signout() async {
    await Auth().signOut();
  }

  Widget _userId() {
    return Text(user?.email ?? 'User email',style: TextStyle(
      fontSize: 35,
    ),);
  }

  Widget signOutButton() {
    return ElevatedButton(onPressed: signout, child:const Text('Sign out'));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _userId(),
              SizedBox(height: 40,),
              signOutButton(),

            ],
          ),
        ),
      ),
    );
  }
}
