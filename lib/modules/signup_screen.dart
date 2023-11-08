import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class SignUpscreen extends StatefulWidget {
  const SignUpscreen({super.key});
  @override
  State<SignUpscreen> createState() => _SignUpscreenState();}
class _SignUpscreenState extends State<SignUpscreen> {
  var formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _ConfirmpasswordController = TextEditingController();
  Future Signup() async {
    var formkey2 = formKey.currentState;
    if (formkey2!.validate()) {
      if (passwordConfirmed()) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim());
        Navigator.of(context).pushNamed('auth');
      }} else {print('not valid');}}
  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _ConfirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  void openSigninScreen() {
    Navigator.of(context).pushReplacementNamed("loginScreen");
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _ConfirmpasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //image

                  Image.asset(
                    'assets/logo.png',
                    height: 200,
                  ),

                  //title

                  Text(
                    "Sign Up",
                    style: GoogleFonts.robotoCondensed(
                        fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  //subtitle

                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Wellcome ! Here you Can sign up :-)",
                    style: GoogleFonts.robotoCondensed(
                      fontSize: 18,
                    ),
                  ),

                  // TextFiled
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          // validator: (val) {
                          //   if (val!.length > 100) {
                          //     return "Email Can't to be larger than 100 letter";
                          //   }
                          //   if (val!.length < 6) {
                          //     return "Email Can't to be Less than 6 letter";
                          //   }
                          //   return null;
                          // },
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          validator: (val) {
                            if (val!.length > 100) {
                              return "Password Can't to be larger than 100 letter";
                            }
                            if (val!.length < 6) {
                              return "Password Can't to be Less than 6 letter";
                            }
                            return null;
                          },
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // button

                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          validator: (val) {
                            if (val!.length > 100) {
                              return "Password Confirm Can't to be larger than 100 letter";
                            }
                            if (val!.length < 6) {
                              return "Password Confirm Can't to be Less than 6 letter";
                            }
                            return null;
                          },
                          controller: _ConfirmpasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Confirm Password',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: GestureDetector(
                      onTap: Signup,
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [Color.fromRGBO(93,224,230,1),Color.fromRGBO(0,74,173,1)],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                            child: Text(
                              'Sign Up',
                              style: GoogleFonts.robotoCondensed(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  //Text sign up

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already a member ? ',
                        style: GoogleFonts.robotoCondensed(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: openSigninScreen,
                        child: Text(
                          ' Sign in Now',
                          style: GoogleFonts.robotoCondensed(
                            color: const Color.fromRGBO(0,74,173,1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
