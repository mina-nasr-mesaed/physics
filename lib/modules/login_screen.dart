import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Firebase/auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  String? errorMessage = '';
  bool islogin = true;
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _entryField(String title,
      TextEditingController controller,) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage');
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed: islogin
          ? signInWithEmailAndPassword
          : createUserWithEmailAndPassword,
      child: Text('Login'),
    );
  }

  Widget _loginButton() {
    return TextButton(
        onPressed: () {
          setState(() {
            islogin = !islogin;
          });
        },
      child: Text(islogin ? 'Register instead': 'Login instead'),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginScreen'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                      'assets/logo.png',
                      height: 250,
                    ),
              SizedBox(height: 20,),
              Text(
                      "SIGN IN",
                      style: GoogleFonts.robotoCondensed(
                          fontSize: 40, fontWeight: FontWeight.bold),
                    ),
              SizedBox(height: 40,),
              _entryField('email', _controllerEmail),
              _entryField('password', _controllerPassword),
              _errorMessage(),
              _submitButton(),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();}
// class _LoginScreenState extends State<LoginScreen> {
//
//   var formKey = GlobalKey<FormState>();
//   UserCredential? userCredential;
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   Future Login() async {
//     var formkey2 = formKey.currentState;
//     if (formkey2!.validate()) {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: _emailController.text.trim(),
//           password: _passwordController.text.trim());
//     } else {print('not valid');}}
//
//   void openSignupScreen() {Navigator.of(context).pushReplacementNamed("signupScreen");}
//   @override
//   void dispose() {super.dispose();_emailController.dispose();_passwordController.dispose();}
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             child: Form(
//               key: formKey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   //image
//                   Image.asset(
//                     'assets/logo.png',
//                     height: 250,
//                   ),
//
//                   //title
//                   Text(
//                     "SIGN IN",
//                     style: GoogleFonts.robotoCondensed(
//                         fontSize: 40, fontWeight: FontWeight.bold),
//                   ),
//                   //subtitle
//
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     "Weclome back! Nice to See You",
//                     style: GoogleFonts.robotoCondensed(
//                       fontSize: 18,
//                     ),
//                   ),
//
//                   // TextFiled
//                   SizedBox(
//                     height: 50,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 25),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.grey[200],
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: TextFormField(
//                           validator: (val) {
//                             if (val!.length > 100) {
//                               return "Email Can't to be larger than 100 letter";
//                             }
//                             if (val!.length < 6) {
//                               return "Email Can't to be Less than 6 letter";
//                             }
//                             return null;
//                           },
//
//                           controller: _emailController,
//                           decoration: InputDecoration(
//                             hintText: 'Email',
//                             border: InputBorder.none,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 25),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.grey[200],
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: TextFormField(
//                           validator: (val) {
//                             if (val!.length > 100) {
//                               return "passord Can't to be larger than 100 letter";
//                             }
//                             if (val!.length < 6) {
//                               return "password Can't to be Less than 6 letter";
//                             }
//                             return null;
//                           },
//                           controller: _passwordController,
//                           obscureText: true,
//                           decoration: InputDecoration(
//                             hintText: 'Password',
//                             border: InputBorder.none,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//
//                   // button
//
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 25),
//                     child: GestureDetector(
//                       onTap: Login,
//                       child: Container(
//                         padding: EdgeInsets.all(16),
//                         decoration: BoxDecoration(
//                             gradient: const LinearGradient(
//                                 colors: [Color.fromRGBO(93,224,230,1),Color.fromRGBO(0,74,173,1)],
//                                 begin: Alignment.bottomLeft,
//                                 end: Alignment.topRight),
//                             borderRadius: BorderRadius.circular(12)),
//                         child: Center(
//                             child: Text(
//                               'LOGIN',
//                               style: GoogleFonts.robotoCondensed(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 18,
//                               ),
//                             )),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//
//                   //Text sign up
//
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "you don't have an Account ? ",
//                         style: GoogleFonts.robotoCondensed(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: openSignupScreen,
//                         child: Text(
//                           ' Sign Up Now',
//                           style: GoogleFonts.robotoCondensed(
//                             color: const Color.fromRGBO(0,74,173,1),
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
