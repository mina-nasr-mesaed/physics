import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:physics/Firebase/tree.dart';
import 'package:physics/modules/pdf_list.dart';
import 'package:physics/modules/view_pdf.dart';
import 'Firebase/auth.dart';
import 'modules/home_screen.dart';
import 'modules/level_Screen.dart';
import 'modules/login_screen.dart';
import 'modules/signup_screen.dart';
import 'modules/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

Future<FirebaseApp> _initializeFirebase() async {
  FirebaseApp firebaseApp =await Firebase.initializeApp();
  return firebaseApp;
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        //Color(0xFF7ED957) green
        //Color(0xFF0097B2)  blue
        // [Color(0xFF0097B2), Color(0xFF7ED957)] gradiunt
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
      ),
      initialRoute: '/',
      routes: {
        "/": (context) => SplashScreen(),
        "tree": (context) => Tree(),
        "loginScreen": (context) =>  LoginScreen(),
        "signupScreen": (context) => SignUpscreen(),
        "homeScreen": (context) => HomeScreen(),
        "level": (context) =>Level(),
        'pdf_list':(context) =>pdf_list(),
        //"form":(Context)=>Form1(),
      },
    );
  }
}
