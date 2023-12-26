// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:physics/modules/Authentication/splash_screen.dart';
// import 'package:physics/modules/home_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
//
// class Login extends StatefulWidget {
//   @override
//   State<Login> createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//   final _formkey = GlobalKey<FormState>();
//   final TextEditingController _controllerEmail = TextEditingController();
//   final TextEditingController _controllerPassword = TextEditingController();
//   final _auth = FirebaseAuth.instance;
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     _controllerEmail.dispose();
//     _controllerPassword.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: ListView(
//           children: [
//             Center(
//               child: Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Image.asset('assets/logo.png'),
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.all(20),
//               child: Form(
//                 key: _formkey,
//                 child: Column(
//                   children: [
//                     Text(
//                       'LOGIN',
//                       style: GoogleFonts.robotoCondensed(
//                           fontSize: 40, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     TextFormField(
//                       controller: _controllerEmail,
//                       validator: (val) {
//                         if (val!.length > 100) {
//                           return "username can't to be larger than 100 letter";
//                         }
//                         if (val!.length < 6) {
//                           return "username can't to be less than 6 letter";
//                         }
//                         return null;
//                       },
//                       decoration: InputDecoration(
//                         prefixIcon: Icon(Icons.person),
//                         hintText: "Email address",
//                         border: OutlineInputBorder(
//                             borderSide: BorderSide(width: 1)),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     TextFormField(
//                       controller: _controllerPassword,
//                       validator: (val) {
//                         if (val!.length > 100) {
//                           return "username can't to be larger than 100 letter";
//                         }
//                         if (val!.length < 6) {
//                           return "username can't to be less than 6 letter";
//                         }
//                         return null;
//                       },
//                       decoration: InputDecoration(
//                         prefixIcon: Icon(Icons.password),
//                         hintText: "password",
//                         border: OutlineInputBorder(
//                             borderSide: BorderSide(width: 1)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 25),
//               child: GestureDetector(
//                 onTap: Login,
//                 child: Container(
//                   padding: EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                       gradient: const LinearGradient(colors: [
//                         Color.fromRGBO(93, 224, 230, 1),
//                         Color.fromRGBO(0, 74, 173, 1)
//                       ], begin: Alignment.bottomLeft, end: Alignment.topRight),
//                       borderRadius: BorderRadius.circular(12)),
//                   child: Center(
//                       child: Text(
//                     'LOGIN',
//                     style: GoogleFonts.robotoCondensed(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                     ),
//                   )),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "you don't have an Account ? ",
//                     style: GoogleFonts.robotoCondensed(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.of(context).pushReplacementNamed("signup");
//                     },
//                     child: Text(
//                       ' Sign Up Now',
//                       style: GoogleFonts.robotoCondensed(
//                         color: const Color.fromRGBO(0, 74, 173, 1),
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// void route(context) {
//   User? user = FirebaseAuth.instance.currentUser;
//   var kk = FirebaseFirestore.instance
//       .collection('users')
//       .doc(user!.uid)
//       .get()
//       .then((DocumentSnapshot documentSnapshot) {
//     if (documentSnapshot.exists) {
//       if (documentSnapshot.get('rool') == "Teacher") {
//         Navigator.pushReplacement(
//           context as BuildContext,
//           MaterialPageRoute(
//             builder: (context) =>  SplashScreen(),
//           ),
//         );
//       }else{
//         Navigator.pushReplacement(
//           context as BuildContext,
//           MaterialPageRoute(
//             builder: (context) =>  SplashScreen(),
//           ),
//         );
//       }
//     } else {
//       print('Document does not exist on the database');
//     }
//   });
// }
// void signIn(String email, String password) async {
//   if (_formkey.currentState!.validate()) {
//     try {
//       UserCredential userCredential =
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       route(context);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         print('No user found for that email.');
//       } else if (e.code == 'wrong-password') {
//         print('Wrong password provided for that user.');
//       }
//     }
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:physics/modules/Authentication/signup_screen.dart';
import 'package:physics/modules/Authentication/splash_screen.dart';
import 'package:physics/modules/admin/home_screen.dart';
import 'package:physics/modules/student/home_student_page.dart';




class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure3 = true;
  bool visible = false;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.blueAccent[700],
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(12),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/logo.png'),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 40,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Email',
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value!.length == 0) {
                              return "Email cannot be empty";
                            }
                            if (!RegExp(
                                "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please enter a valid email");
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            emailController.text = value!;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: _isObscure3,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure3
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isObscure3 = !_isObscure3;
                                  });
                                }),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Password',
                            enabled: true,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 15.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: new BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            RegExp regex = new RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            }
                            if (!regex.hasMatch(value)) {
                              return ("please enter valid password min. 6 character");
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            passwordController.text = value!;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                          elevation: 5.0,
                          height: 40,
                          onPressed: () {
                            setState(() {
                              visible = true;
                            });
                            signIn(
                                emailController.text, passwordController.text);
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Visibility(
                            maintainSize: true,
                            maintainAnimation: true,
                            maintainState: true,
                            visible: visible,
                            child: Container(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ))),
                      ],
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('rool') == "Teacher") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>  HomeScreen(),
            ),
          );
        }else{
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>  home_student(),
            ),
          );
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      try {
        UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        route();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
  }
}


