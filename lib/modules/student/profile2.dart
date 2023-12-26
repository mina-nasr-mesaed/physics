import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Firebase/auth.dart';
import '../Authentication/login_screen.dart';

class profile2 extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;


  Widget _userId() {
    return Text('${user.email}',style: TextStyle(fontSize: 30,));
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
              ElevatedButton(onPressed: (){logout(context);}, child:const Text('Sign out')),

            ],
          ),
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
}
