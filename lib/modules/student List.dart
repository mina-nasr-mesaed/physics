import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:physics/modules/Authentication/signup_screen.dart';

class Student_List extends StatefulWidget {
  const Student_List({super.key});

  @override
  State<Student_List> createState() => _Student_ListState();
}

final user = FirebaseAuth.instance.currentUser!;

class _Student_ListState extends State<Student_List> {
  List users = [];
  CollectionReference usersRef = FirebaseFirestore.instance.collection('users');

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
      appBar: AppBar(
        leading: IconButton(
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).pushReplacementNamed("home");
            },
            icon: Icon(Icons.home)),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.person_add_alt_1_sharp),
          onPressed: () {
            logout(context);
          }),
      body: SafeArea(
          child: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, i) {
          return Column(
            children: [
              Text(
                " Name : ${users[i]['name']}",
                style: TextStyle(fontSize: 21),
              ),
              Text(
                " email : ${users[i]['email']}",
                style: TextStyle(fontSize: 21),
              ),
              Text(
                " password : ${users[i]['password']}",
                style: TextStyle(fontSize: 21),
              ),
              Text(
                " level : ${users[i]['level']}",
                style: TextStyle(fontSize: 21),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 1,
                color: Colors.grey,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          );
        },
      )),
    );
  }
}
Future<void> logout(BuildContext context) async {
  CircularProgressIndicator();
  await FirebaseAuth.instance.signOut();
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => Register(),
    ),
  );
}
